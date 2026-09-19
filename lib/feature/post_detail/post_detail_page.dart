import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:animage/feature/downloader/download_cubit.dart';
import 'package:animage/feature/downloader/download_state.dart';
import 'package:animage/feature/downloader/post_download_state.dart';
import 'package:animage/feature/post_detail/post_detail_cubit.dart';
import 'package:animage/feature/post_detail/post_detail_state.dart';
import 'package:animage/shared/widgets/favorite_checkbox.dart';
import 'package:animage/shared/widgets/gallery_list_item.dart';
import 'package:animage/shared/widgets/list_loading_footer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/entity/post.dart';
import '../../shared/data/tag_selection.dart';
import '../../shared/extension/context_extension.dart';
import '../../shared/widgets/removable_chip.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)?.settings.arguments as Post?;
    if (post == null) {
      return const SizedBox.shrink();
    }

    return BlocProvider(
      create: (context) => PostDetailCubit(post)..init(),
      child: BlocBuilder<PostDetailCubit, PostDetailState>(
        builder: (context, state) {
          return Platform.isIOS
              ? CupertinoPageScaffold(child: _Body(state: state))
              : Scaffold(body: _Body(state: state));
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final PostDetailState state;

  @override
  Widget build(BuildContext context) {
    final post = state.post;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          final coverMaxHeight = maxHeight * 0.75;

          final sampleWidth = post.sampleWidth;
          final sampleHeight = post.sampleHeight;

          final coverHeight = sampleWidth != null && sampleHeight != null
              ? min(
                  (maxWidth * sampleHeight).toDouble() / sampleWidth,
                  coverMaxHeight,
                )
              : coverMaxHeight;

          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(photoViewerRoute, arguments: [post]);
                          },
                          child: CachedNetworkImage(
                            width: maxWidth,
                            height: coverHeight,
                            imageUrl: post.sampleUrl ?? "",
                            errorWidget: (context, url, error) => Container(
                              constraints: const BoxConstraints.expand(),
                              color: context.cardViewBackgroundColor,
                            ),
                          ),
                        ),

                        _CoverFooter(post: post),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Post ID
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: _TopInfoSection(state),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Post ID
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Text(
                        post.postId,
                        style: _tagTitleTextStyle(context),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Tags
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Wrap(
                        spacing: space1,
                        runSpacing: spaceHalf,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: spaceHalf,
                            ),
                            child: Text(
                              "Tags:",
                              style: _tagTitleTextStyle(context),
                            ),
                          ),
                          ...post.tagList.map(
                            (tag) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).popUntilWithResult(
                                  (route) =>
                                      route.settings.name != detailsPageRoute,
                                  TagSelection(tag),
                                );
                              },
                              child: RemovableChip(
                                label: tag,
                                bgColor: brandColor,
                                textColor: white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Rating
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Text(
                        post.ratingLabel,
                        style: _tagTitleTextStyle(context),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Source
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Text(
                        post.sourceLabel,
                        style: _tagTitleTextStyle(context),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // File size
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Text(
                        post.fileSizeLabel,
                        style: _tagTitleTextStyle(context),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Created at
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Text(
                        post.createdAtTimeStamp,
                        style: _tagTitleTextStyle(context),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                  // Updated at
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space1),
                      child: Text(
                        post.updatedAtTimeStamp,
                        style: _tagTitleTextStyle(context),
                      ),
                    ),
                  ),

                  if (state.children.isNotEmpty) ...[
                    SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: space1),
                        child: Text(
                          "Children:",
                          style: _tagTitleTextStyle(context),
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: space1)),

                    for (
                      int index = 0;
                      index < state.children.length;
                      index++
                    ) ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: space1,
                          ),
                          child: GalleryListItem(
                            data: state.children[index],
                            itemAspectRatio: 1.5,
                            onSelect: () {
                              Navigator.of(context).pushNamed(
                                detailsPageRoute,
                                arguments: state.children[index],
                              );
                            },
                          ),
                        ),
                      ),
                      if (index < state.children.length - 1)
                        SliverToBoxAdapter(child: SizedBox(height: space1)),
                    ],
                  ],

                  if (state.loadingChildren) ...[
                    SliverToBoxAdapter(child: SizedBox(height: spaceOneHalf)),

                    SliverToBoxAdapter(child: ListLoadingFooter()),
                  ],

                  SliverToBoxAdapter(child: SizedBox(height: space5)),
                ],
              ),

              Container(
                height: kToolbarHeight * 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[black200, transparency],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: space3,
                      height: space3,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Platform.isIOS
                              ? CupertinoIcons.back
                              : Icons.arrow_back,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CoverFooter extends StatelessWidget {
  const _CoverFooter({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: spaceHalf,
            horizontal: space1,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: spaceHalf,
                  children: [
                    Text(
                      "Author: ${post.author ?? "Unknown"}",
                      style: _coverFooterTextStyle(context)
                          ?.copyWith(color: brandColor),
                    ),
                    Text(
                      "Score: ${post.score ?? "Unknown"}",
                      style: _coverFooterTextStyle(context)
                          ?.copyWith(color: brandColor),
                    ),
                  ],
                ),
              ),
              FavoriteCheckbox(
                size: space3,
                color: brandColor,
                isFavorite: false,
                onFavoriteChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopInfoSection extends StatelessWidget {
  const _TopInfoSection(this.state);

  final PostDetailState state;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadCubit, DownloadState>(
      listener: (context, downloadState) {
        final postDownloadState =
            downloadState.postDownloadingStatus[state.post.id];
        if (postDownloadState is PermissionNotGrantedState) {
          unawaited(openAppSettings());
        } else if (postDownloadState is DownloadFinishedState) {
          final resultText = postDownloadState.savedResult.isSuccess
              ? 'Downloaded post ${state.post.id}'
              : 'Failed to download post ${state.post.id}';
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(resultText),
                duration: Duration(seconds: 3),
              ),
            );
        }
      },
      builder: (context, downloadState) {
        final postDownloadState =
            downloadState.postDownloadingStatus[state.post.id];
        bool isDownloading = postDownloadState is DownloadingState;
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: space1,
          children: [
            if (isDownloading)
              _downloadingIndicator()
            else
              _downloadButton(context),
            Platform.isIOS
                ? CupertinoButton(
                    child: Icon(CupertinoIcons.share),
                    onPressed: () {},
                  )
                : IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        );
      },
    );
  }

  Widget _downloadButton(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () {
              context.read<DownloadCubit>().downloadPost(state.post);
            },
            child: Icon(CupertinoIcons.cloud_download),
          )
        : IconButton(
            onPressed: () {
              context.read<DownloadCubit>().downloadPost(state.post);
            },
            icon: Icon(Icons.cloud_download),
          );
  }

  Widget _downloadingIndicator() {
    return Platform.isIOS
        ? CupertinoActivityIndicator(radius: space2, color: brandColor)
        : SizedBox(
            width: space3,
            height: space3,
            child: CircularProgressIndicator(color: brandColor),
          );
  }
}

TextStyle? _coverFooterTextStyle(BuildContext context) {
  return (Platform.isIOS
      ? CupertinoTheme.of(context).textTheme.navTitleTextStyle
      : Theme.of(context).textTheme.headlineSmall);
}

TextStyle? _tagTitleTextStyle(BuildContext context) {
  return (Platform.isIOS
      ? CupertinoTheme.of(context).textTheme.textStyle
      : Theme.of(context).textTheme.bodyLarge);
}
