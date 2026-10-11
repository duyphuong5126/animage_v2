import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:animage/domain/entity/artist.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/post_additional_info/post_additional_info.dart';
import 'package:animage/feature/post_additional_info/post_additional_info_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extension/context_extension.dart';
import 'favorite_checkbox.dart';

class GalleryListItem extends StatefulWidget {
  final Post data;
  final double itemAspectRatio;
  final VoidCallback onSelect;

  const GalleryListItem({
    super.key,
    required this.data,
    required this.itemAspectRatio,
    required this.onSelect,
  });

  @override
  State<GalleryListItem> createState() => _GalleryListItemState();
}

class _GalleryListItemState extends State<GalleryListItem> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    BoxFit boxFit = data.sampleAspectRatio > widget.itemAspectRatio
        ? BoxFit.cover
        : BoxFit.fitWidth;

    return BlocBuilder<PostAdditionalInfoCubit, PostAdditionalInfo>(
      builder: (context, additionalInfo) {
        final artist = additionalInfo.artistOfPost[data.id];
        final isFavorite = additionalInfo.favoriteIds.contains(data.id);

        final width = data.width;
        final height = data.height;

        final ratio = width != null && height != null
            ? '$width×$height'
            : null;

        return GestureDetector(
          onTap: widget.onSelect,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(space2)),
            child: AspectRatio(
              aspectRatio: widget.itemAspectRatio,
              child: Container(
                color: context.cardViewBackgroundColor,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    CachedNetworkImage(
                      imageUrl: data.sampleUrl ?? "",
                      width: double.infinity,
                      height: double.infinity,
                      alignment: FractionalOffset.topCenter,
                      errorWidget: (context, url, error) => Container(
                        constraints: const BoxConstraints.expand(),
                        color: context.cardViewBackgroundColor,
                      ),
                      fit: boxFit,
                    ),
                    Container(
                      constraints: const BoxConstraints.expand(height: space11),
                      padding: const EdgeInsets.symmetric(
                        vertical: space1,
                        horizontal: space2,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[black200, transparency],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.author ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: _authorTextStyle(context),
                                ),
                                _ArtistInfo(artist),
                              ],
                            ),
                          ),
                          FavoriteCheckbox(
                            key: ValueKey(DateTime.now()),
                            size: space3,
                            color: brandColor,
                            isFavorite: isFavorite,
                            onFavoriteChanged: (newFavorite) {
                              context
                                  .read<PostAdditionalInfoCubit>()
                                  .updateFavorite(
                                    data,
                                    isFavorite: newFavorite,
                                  );
                            },
                          ),
                        ],
                      ),
                    ),

                    if (ratio != null)
                      Positioned(
                        bottom: space1,
                        right: space2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: black150,
                            borderRadius: BorderRadius.all(
                              Radius.circular(spaceHalf),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: spaceQuarter,
                            horizontal: spaceHalf,
                          ),
                          child: Text(
                            ratio,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: _ratioTextStyle(context),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ArtistInfo extends StatelessWidget {
  const _ArtistInfo(this.artist);

  final Artist? artist;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: artist != null,
      child: Text(
        artist?.name ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _artistTextStyle(context),
      ),
    );
  }
}

TextStyle? _authorTextStyle(BuildContext context) {
  return (Platform.isIOS
          ? CupertinoTheme.of(context).textTheme.textStyle
          : Theme.of(context).textTheme.bodyLarge)
      ?.copyWith(color: white);
}

TextStyle? _artistTextStyle(BuildContext context) {
  return (Platform.isIOS
          ? CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle
          : Theme.of(context).textTheme.headlineMedium)
      ?.copyWith(color: white);
}

TextStyle? _ratioTextStyle(BuildContext context) {
  return (Platform.isIOS
          ? CupertinoTheme.of(context).textTheme.tabLabelTextStyle
          : Theme.of(context).textTheme.labelLarge)
      ?.copyWith(color: white);
}
