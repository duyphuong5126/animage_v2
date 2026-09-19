import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../constant.dart';
import '../../dimension.dart';

class ListLoadingFooter extends StatefulWidget {
  const ListLoadingFooter({super.key});

  @override
  State<ListLoadingFooter> createState() => _ListLoadingFooterState();
}

class _ListLoadingFooterState extends State<ListLoadingFooter>
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
      padding: const EdgeInsets.symmetric(vertical: spaceHalf),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(space1)),
      ),
      child: Row(
        children: [
          Gif(
            image: AssetImage(loadingGifAsset),
            height: space10,
            width: space10,
            autostart: Autostart.loop,
            duration: Duration(seconds: 4),
            controller: _controller,
          ),
          Flexible(
            child: Text("Loading...", style: _loadingTextStyle(context)),
          ),
        ],
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
