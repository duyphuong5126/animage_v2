import 'dart:async';
import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:animage/domain/entity/gallery_level.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/gallery/gallery_cubit.dart';
import 'package:animage/shared/enum/gallery_mode.dart';
import 'package:animage/feature/gallery/state/gallery_state.dart';
import 'package:animage/feature/gallery/state/page_state.dart';
import 'package:animage/feature/post_additional_info/post_additional_info_cubit.dart';
import 'package:animage/shared/widgets/empty_page_content.dart';
import 'package:animage/shared/widgets/gallery_list_item.dart';
import 'package:animage/shared/widgets/gallery_mode_switch.dart';
import 'package:animage/shared/widgets/list_loading_footer.dart';
import 'package:animage/shared/widgets/removable_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data/tag_selection.dart';
import '../../utils/log.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  Future<void> _processPageData(
    BuildContext context, {
    required Iterable<PageData> pages,
  }) async {
    final List<Post> posts = [for (final page in pages) ...page.data];
    unawaited(context.read<PostAdditionalInfoCubit>().processPosts(posts));
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return BlocProvider(
      create: (context) => GalleryCubit()..init(),
      child: BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) {
          unawaited(
            _processPageData(
              context,
              pages: state.pages.values.whereType<PageData>(),
            ),
          );
        },
        builder: (context, state) {
          final hasTag =
              state.tags.isNotEmpty || state.galleryLevel != GalleryLevel.safe;

          final hasError = state.pages.values.any((page) => page is PageError);
          logD('hasError=$hasError');
          final body = Stack(
            alignment: Alignment.topRight,
            children: [
              state.data.isNotEmpty || state.loading
                  ? _InfinityGallery(state)
                  : EmptyPageContent(
                      title: hasError ? 'Error occurred' : 'Empty Gallery',
                      message: hasError
                          ? 'Please try again.'
                          : 'No content matches you search.',
                      actionData: hasError
                          ? EmptyContentAction(
                              label: 'Retry',
                              action: () {
                                context.read<GalleryCubit>().retry();
                              },
                            )
                          : null,
                    ),
              Container(
                color: hasTag
                    ? isDark
                          ? black
                          : white
                    : null,
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: spaceHalf,
                  horizontal: space2,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasTag)
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: space1,
                            children: [
                              for (final tag in state.tags)
                                RemovableChip(
                                  label: tag,
                                  bgColor: brandColor,
                                  textColor: white,
                                  allowRemoval: true,
                                  onRemove: () {
                                    context.read<GalleryCubit>().removeTag(tag);
                                  },
                                ),
                              if (state.galleryLevel != GalleryLevel.safe)
                                RemovableChip(
                                  label: state.galleryLevel.value,
                                  bgColor: brandColor,
                                  textColor: white,
                                  allowRemoval: true,
                                  onRemove: () {
                                    context.read<GalleryCubit>().setLevel(
                                      GalleryLevel.safe,
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    GalleryModeSwitch(
                      onModeSelected: (mode) {
                        context.read<GalleryCubit>().changeMode(mode);
                      },
                      galleryMode: state.galleryMode,
                    ),
                  ],
                ),
              ),
            ],
          );
          return Platform.isIOS
              ? CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(middle: _SearchView()),
                  child: SafeArea(child: body),
                )
              : Scaffold(
                  appBar: AppBar(title: _SearchView()),
                  body: SafeArea(child: body),
                );
        },
      ),
    );
  }
}

class _InfinityGallery extends StatefulWidget {
  const _InfinityGallery(this.state);

  final GalleryState state;

  @override
  State<_InfinityGallery> createState() => _InfinityGalleryState();
}

class _InfinityGalleryState extends State<_InfinityGallery> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = widget.state.data;
    final itemCount = list.length;
    final hasMoreData = widget.state.hasMoreData;

    if (widget.state.galleryMode == GalleryMode.grid) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: space1),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: space8)),

            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: space1,
                crossAxisSpacing: space1,
                childAspectRatio: 1.0,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final post = list[index];
                return GalleryListItem(
                  data: post,
                  itemAspectRatio: 1.0,
                  onSelect: () {
                    unawaited(_navigateToDetailPage(context, post: post));
                  },
                );
              },
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: space2, bottom: space3),
                child: ListLoadingFooter(),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: space1),
      itemCount: itemCount + (hasMoreData ? 1 : 0) + 1,
      separatorBuilder: (context, index) {
        return SizedBox(height: space1);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(height: space6);
        }
        if (index == itemCount + 1) {
          return ListLoadingFooter();
        }
        final dataIndex = index - 1;
        final post = list[dataIndex];
        return GalleryListItem(
          data: post,
          itemAspectRatio: 1.5,
          onSelect: () {
            unawaited(_navigateToDetailPage(context, post: post));
          },
        );
      },
    );
  }

  Future<void> _navigateToDetailPage(
    BuildContext context, {
    required Post post,
  }) async {
    final result = await Navigator.of(context)
        .pushNamed(detailsPageRoute, arguments: post);
    if (result is TagSelection && context.mounted) {
      context.read<GalleryCubit>().search(result.tag);
    }
  }

  void _onScroll() {
    final maxPageIndex = widget.state.maxPageIndex;

    final position = _scrollController.position;
    final screenHeight = MediaQuery.of(context).size.height;
    final offset = screenHeight / 2;
    final passedHalfScreen =
        position.maxScrollExtent > screenHeight &&
        position.pixels > position.maxScrollExtent - offset;
    final exceededMaxExtent =
        position.maxScrollExtent.round() == position.pixels.round();
    if ((passedHalfScreen || exceededMaxExtent) && maxPageIndex != null) {
      final cubit = context.read<GalleryCubit>();
      final nextPage = maxPageIndex + 1;
      unawaited(cubit.loadPage(nextPage));
    }
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    // 1. Định nghĩa font size và chiều cao dòng (line-height) rõ ràng
    const double fontSize = 15.0;
    final textStyle = TextStyle(
      fontSize: fontSize,
      color: black222,
      height: 1.2, // Giúp kiểm soát chính xác chiều cao của text dòng đơn
    );

    return SizedBox(
      height: space6, // = 48.0
      child: TextField(
        controller: _editingController,
        style: textStyle,
        textAlignVertical: TextAlignVertical.center,
        // 2. Ép nội dung căn giữa theo chiều dọc
        onSubmitted: (query) {
          context.read<GalleryCubit>().search(query);
          _editingController.clear();
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? white : grey217,
          hintText: 'Search',
          hintStyle: textStyle.copyWith(color: grey117),

          isDense: true,
          // 3. Sử dụng padding vừa phải cho chiều cao 48.0
          // vertical: 12.0 giúp cân bằng khoảng trống trên/dưới mà không làm vỡ layout
          contentPadding: EdgeInsets.symmetric(
            horizontal: space2, // = 16.0 (khoảng cách lề trái phải rất đẹp)
            vertical: spaceOneHalf,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Platform.isIOS ? iosTextFieldRadius : space1,
              ), // space1 = 8.0
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
