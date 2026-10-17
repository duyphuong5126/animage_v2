import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../constant.dart';
import '../../dimension.dart';

class LoadingPageContent extends StatefulWidget {
  const LoadingPageContent({super.key});

  @override
  State<LoadingPageContent> createState() => _LoadingPageContentState();
}

class _LoadingPageContentState extends State<LoadingPageContent>
    with TickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(space2),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: white,
              child: Gif(
                image: AssetImage(loadingGifAsset),
                height: space10,
                width: space10,
                autostart: Autostart.loop,
                duration: Duration(seconds: 4),
                controller: _controller,
              ),
            ),
            Text("Loading...", style: _loadingTextStyle(context)),
          ],
        ),
      ),
    );
  }

  TextStyle? _loadingTextStyle(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTheme.of(context).textTheme.navTitleTextStyle
              .copyWith(color: black)
        : Theme.of(context).textTheme.bodyLarge?.copyWith(color: black);
  }
}
