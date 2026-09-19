import 'dart:io';

import 'package:animage/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class RemovableChip extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String label;
  final bool allowRemoval;
  final Function? onRemove;

  const RemovableChip({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
    this.allowRemoval = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: allowRemoval
          ? const EdgeInsets.only(left: space2, right: space1)
          : const EdgeInsets.symmetric(vertical: spaceHalf, horizontal: space1),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(space1)),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label,
              style: _labelTextStyle(context)?.copyWith(color: textColor),
            ),
          ),
          Visibility(
            visible: allowRemoval,
            child: CupertinoButton(
              minimumSize: Size(0, 0),
              padding: const EdgeInsets.symmetric(
                vertical: spaceThreeQuarter,
                horizontal: space1,
              ),
              child: Icon(
                Platform.isIOS ? CupertinoIcons.clear : Icons.clear,
                color: white,
                size: space3,
              ),
              onPressed: () => onRemove?.call(),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle? _labelTextStyle(BuildContext context) {
  return (Platform.isIOS
      ? CupertinoTheme.of(context).textTheme.textStyle
      : Theme.of(context).textTheme.bodyLarge);
}
