import 'dart:io';

import 'package:animage/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyContentAction {
  final Function() action;
  final String label;

  const EmptyContentAction({required this.label, required this.action});
}

class EmptyPageContent extends StatelessWidget {
  const EmptyPageContent({
    super.key,
    required this.title,
    required this.message,
    this.actionData,
  });

  final String title;
  final String message;
  final EmptyContentAction? actionData;

  @override
  Widget build(BuildContext context) {
    final action = actionData;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: space1,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space2),
            child: Text(title, style: _titleTextStyle(context)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space2),
            child: Text(message, style: _messageTextStyle(context)),
          ),
          if (action != null)
            Platform.isIOS
                ? CupertinoButton(
                    onPressed: action.action,
                    child: Text(action.label),
                  )
                : TextButton(
                    onPressed: action.action,
                    child: Text(action.label),
                  ),
        ],
      ),
    );
  }
}

TextStyle? _titleTextStyle(BuildContext context) {
  return Platform.isIOS
      ? CupertinoTheme.of(context).textTheme.navTitleTextStyle
      : Theme.of(context).textTheme.headlineSmall;
}

TextStyle? _messageTextStyle(BuildContext context) {
  return Platform.isIOS
      ? CupertinoTheme.of(context).textTheme.textStyle
      : Theme.of(context).textTheme.bodyLarge;
}
