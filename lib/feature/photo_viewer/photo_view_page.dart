import 'dart:async';
import 'dart:io';

import 'package:animage/dimension.dart';
import 'package:animage/shared/widgets/fading_appbar_ios.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

import '../../constant.dart';
import '../../domain/entity/post.dart';
import '../../shared/widgets/fading_appbar_android.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({super.key});

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  int? _postId;
  bool _isSwipeEnabled = true;

  @override
  Widget build(BuildContext context) {
    final posts =
        (ModalRoute.of(context)?.settings.arguments as List<Post>?) ?? [];

    Map<int, String> data = {};
    for (final post in posts) {
      final url = post.fileUrl;
      if (url != null && url.isNotEmpty) {
        data[post.id] = url;
      }
    }

    final pages = data.entries;
    if (_postId == null && pages.isNotEmpty) {
      _postId = pages.first.key;
    }

    final title = _postId != null ? "Post #$_postId" : null;

    final body = pages.isNotEmpty
        ? PageView.builder(
            allowImplicitScrolling: true,
            physics: _isSwipeEnabled
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            onPageChanged: (int pageIndex) {
              setState(() {
                _postId = pages.elementAt(pageIndex).key;
              });
            },
            itemBuilder: (context, int index) {
              String url = pages.elementAt(index).value;
              return _Page(
                url: url,
                onScaleStateChanged: (PhotoViewScaleState state) {
                  setState(() {
                    _isSwipeEnabled = state.index == 0;
                  });
                },
                onTapUp: (context, details, value) {
                  switch (_animationController.status) {
                    case AnimationStatus.completed:
                      {
                        _animationController.reverse();
                        break;
                      }

                    case AnimationStatus.dismissed:
                      {
                        _animationController.forward();
                        break;
                      }
                    default:
                      break;
                  }
                },
              );
            },
          )
        : Container();
    return Platform.isIOS
        ? CupertinoPageScaffold(
            backgroundColor: CupertinoColors.black,
            child: Stack(
              children: [
                body,
                FadingAppBarIOS(
                  appBar: CupertinoNavigationBar(
                    backgroundColor: transparency,
                    enableBackgroundFilterBlur: false,
                    border: null,
                    middle: title != null
                        ? Text(title, style: const TextStyle(color: white))
                        : null,
                  ),
                  controller: _animationController,
                ),
              ],
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor: black,
            appBar: FadingAppBarAndroid(
              appBar: AppBar(
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  statusBarColor: transparency,
                ),
                iconTheme: const IconThemeData(color: white),
                backgroundColor: black100,
                title: title != null
                    ? Text(title, style: const TextStyle(color: white))
                    : null,
              ),
              controller: _animationController,
            ),
            body: body,
          );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _Page extends StatefulWidget {
  const _Page({
    required this.url,
    required this.onScaleStateChanged,
    required this.onTapUp,
  });

  final String url;
  final Function(PhotoViewScaleState state) onScaleStateChanged;
  final PhotoViewImageTapUpCallback onTapUp;

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  Key _photoViewKey = UniqueKey();
  late CachedNetworkImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _initImageProvider();
  }

  @override
  void dispose() {
    unawaited(_imageProvider.evict());
    super.dispose();
  }

  void _initImageProvider() {
    _imageProvider = CachedNetworkImageProvider(widget.url);
  }

  Future<void> _handleRetry() async {
    await _imageProvider.evict();

    setState(() {
      _initImageProvider();
      _photoViewKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      key: _photoViewKey,
      enableRotation: false,
      minScale: PhotoViewComputedScale.contained * 1.0,
      imageProvider: _imageProvider,
      scaleStateChangedCallback: widget.onScaleStateChanged,
      loadingBuilder: (context, event) {
        final cumulativeBytesLoaded = event?.cumulativeBytesLoaded.toDouble();
        final expectedTotalBytes = event?.expectedTotalBytes;
        final value =
            cumulativeBytesLoaded != null && expectedTotalBytes != null
            ? cumulativeBytesLoaded / expectedTotalBytes
            : null;
        return Center(
          child: Platform.isIOS
              ? value != null
                    ? CupertinoActivityIndicator.partiallyRevealed(
                        progress: value,
                        color: brandColor,
                        radius: space2,
                      )
                    : CupertinoActivityIndicator(
                        color: brandColor,
                        radius: space2,
                      )
              : SizedBox(
                  width: space4,
                  height: space4,
                  child: CircularProgressIndicator(
                    value: value,
                    valueColor: AlwaysStoppedAnimation<Color>(brandColor),
                  ),
                ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        onRetry() {
          unawaited(_handleRetry());
        }

        return Platform.isIOS
            ? Center(
                child: CupertinoButton(
                  onPressed: onRetry,
                  child: Text('Retry'),
                ),
              )
            : Center(
                child: TextButton(onPressed: onRetry, child: Text('Retry')),
              );
      },
      onTapUp: widget.onTapUp,
    );
  }
}
