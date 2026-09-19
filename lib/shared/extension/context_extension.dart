import 'package:flutter/material.dart';

extension Contextextension on BuildContext {
  Color get cardViewBackgroundColor =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark
      ? Colors.white
      : Colors.grey[300]!;
}
