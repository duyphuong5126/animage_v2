import 'dart:io';

import 'package:animage/dimension.dart';
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

    final title = _postId != null ? "Post #$_postId" : null;

    final pages = data.entries;
    if (_postId == null && pages.isNotEmpty) {
      _postId = pages.first.key;
    }

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
              return PhotoView(
                enableRotation: false,
                minScale: PhotoViewComputedScale.contained * 1.0,
                imageProvider: CachedNetworkImageProvider(url),
                scaleStateChangedCallback: (PhotoViewScaleState state) {
                  setState(() {
                    _isSwipeEnabled = state.index == 0;
                  });
                },
                loadingBuilder: (context, event) {
                  return Center(
                    child: SizedBox(
                      width: space4,
                      height: space4,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(brandColor),
                      ),
                    ),
                  );
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
        ? CupertinoPageScaffold(child: body)
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
    super.dispose();
    _animationController.dispose();
  }
}
