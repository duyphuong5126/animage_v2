import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef YesNoDialogAction = void Function();

void showYesNoDialog(
  BuildContext context, {
  required String title,
  required String message,
  String labelYes = 'Yes',
  String labelNo = 'No',
  YesNoDialogAction? actionYes,
  YesNoDialogAction? actionNo,
}) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) {
        return YesNoDialogContent(
          title: title,
          message: message,
          labelYes: labelYes,
          labelNo: labelNo,
          actionYes: () {
            Navigator.of(dialogContext).pop();
            actionYes?.call();
          },
          actionNo: () {
            Navigator.of(dialogContext).pop();
            actionNo?.call();
          },
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          child: YesNoDialogContent(
            title: title,
            message: message,
            labelYes: labelYes,
            labelNo: labelNo,
            actionYes: () {
              Navigator.of(dialogContext).pop();
              actionYes?.call();
            },
            actionNo: () {
              Navigator.of(dialogContext).pop();
              actionNo?.call();
            },
          ),
        );
      },
    );
  }
}

class YesNoDialogContent extends StatelessWidget {
  const YesNoDialogContent({
    super.key,
    required this.title,
    required this.message,
    required this.labelYes,
    required this.labelNo,
    required this.actionYes,
    required this.actionNo,
  });

  final String title;
  final String message;
  final String labelYes;
  final String labelNo;
  final YesNoDialogAction? actionYes;
  final YesNoDialogAction? actionNo;

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: space2, vertical: space1),
      decoration: BoxDecoration(
        color: isDark ? grey33 : white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(space2),
          topRight: Radius.circular(space1),
          bottomLeft: Radius.circular(space1),
          bottomRight: Radius.circular(space2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: space2,
        children: [
          SizedBox(
            child: Text(
              title,
              style: _titleTextStyle(context),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Text(
              message,
              style: _messageTextStyle(context),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Platform.isIOS
                      ? CupertinoButton(
                          onPressed: actionNo,
                          foregroundColor: isDark ? white : black,
                          child: Text(labelNo),
                        )
                      : TextButton(
                          onPressed: actionNo,
                          style: TextButton.styleFrom(
                            foregroundColor: isDark ? white : black,
                          ),
                          child: Text(labelNo),
                        ),
                ),

                Expanded(
                  child: Platform.isIOS
                      ? CupertinoButton(
                          onPressed: actionYes,
                          foregroundColor: brandColor,
                          child: Text(labelYes),
                        )
                      : TextButton(
                          onPressed: actionYes,
                          style: TextButton.styleFrom(
                            foregroundColor: brandColor,
                          ),
                          child: Text(labelYes),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle? _titleTextStyle(BuildContext context) {
  return (Platform.isIOS
          ? CupertinoTheme.of(context).textTheme.navTitleTextStyle
          : Theme.of(context).textTheme.headlineSmall)
      ?.copyWith(color: brandColor);
}

TextStyle? _messageTextStyle(BuildContext context) {
  return Platform.isIOS
      ? CupertinoTheme.of(context).textTheme.textStyle
      : Theme.of(context).textTheme.bodyLarge;
}
