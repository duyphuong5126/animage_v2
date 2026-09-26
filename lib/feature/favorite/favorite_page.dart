import 'dart:async';
import 'dart:io';

import 'package:animage/feature/favorite/favorite_cubit.dart';
import 'package:animage/feature/favorite/favorite_state.dart';
import 'package:animage/feature/post_additional_info/post_additional_info.dart';
import 'package:animage/feature/post_additional_info/post_additional_info_cubit.dart';
import 'package:animage/shared/widgets/empty_page_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../dimension.dart';
import '../../domain/entity/post.dart';
import '../../shared/data/tag_selection.dart';
import '../../shared/enum/gallery_mode.dart';
import '../../shared/widgets/gallery_list_item.dart';
import '../../shared/widgets/gallery_mode_switch.dart';
import '../../shared/widgets/list_loading_footer.dart';
import '../tag_selection/tag_selection_cubit.dart';

final _favoriteCountFormat = NumberFormat.decimalPattern();

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..init(),
      child: BlocListener<PostAdditionalInfoCubit, PostAdditionalInfo>(
        listenWhen: (prev, current) {
          return prev.favoriteIds != current.favoriteIds;
        },
        listener: (context, postAdditionalInfo) {
          context.read<FavoriteCubit>().reset();
        },
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final hasError = state.error != null;
            final body = Stack(
              alignment: Alignment.topRight,
              children: [
                state.posts.isNotEmpty
                    ? _InfinityGallery(state)
                    : EmptyPageContent(
                        title: hasError ? 'Error occurred' : 'No Favorite',
                        message: hasError
                            ? 'Please try again.'
                            : 'You can add some on the main gallery',
                        actionData: hasError
                            ? EmptyContentAction(
                                label: 'Retry',
                                action: () {
                                  context.read<FavoriteCubit>().reset();
                                },
                              )
                            : null,
                      ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: spaceHalf,
                    horizontal: space2,
                  ),
                  child: GalleryModeSwitch(
                    onModeSelected: (mode) {
                      context.read<FavoriteCubit>().changeMode(mode);
                    },
                    galleryMode: state.galleryMode,
                  ),
                ),
              ],
            );

            final titleText = state.favoriteCount > 0
                ? 'Favorites (${_favoriteCountFormat.format(state.favoriteCount)})'
                : 'Favorites';
            final title = Text(titleText);
            return Platform.isIOS
                ? CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(middle: title),
                    child: SafeArea(child: body),
                  )
                : Scaffold(
                    appBar: AppBar(title: title),
                    body: SafeArea(child: body),
                  );
          },
        ),
      ),
    );
  }
}

class _InfinityGallery extends StatefulWidget {
  const _InfinityGallery(this.state);

  final FavoriteState state;

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
    final list = widget.state.posts;
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

            if (hasMoreData)
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
      context.read<TagSelectionCubit>().updateTags(result.tags);
    }
  }

  void _onScroll() {
    final position = _scrollController.position;
    final screenHeight = MediaQuery.of(context).size.height;
    final offset = screenHeight / 2;
    final passedHalfScreen =
        position.maxScrollExtent > screenHeight &&
        position.pixels > position.maxScrollExtent - offset;
    final exceededMaxExtent =
        position.maxScrollExtent.round() == position.pixels.round();
    if (passedHalfScreen || exceededMaxExtent) {
      unawaited(context.read<FavoriteCubit>().loadMore());
    }
  }
}
