import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return GestureDetector(
      onTap: widget.onSelect,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
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
                  constraints: const BoxConstraints.expand(height: 80),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[black200, transparency],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            /*Visibility(
                              visible: artistUiModel != null,
                              child: Text(
                                artistUiModel?.name ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                      FavoriteCheckbox(
                        key: ValueKey(DateTime.now()),
                        size: 28,
                        color: brandColor,
                        isFavorite: false,
                        onFavoriteChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
