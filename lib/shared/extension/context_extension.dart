import 'package:flutter/material.dart';

extension Contextextension on BuildContext {
  Color get cardViewBackgroundColor =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark
      ? Colors.white
      : Colors.grey[300]!;

  T themedValue<T>(T lightValue, T darkValue) {
    return MediaQuery.platformBrightnessOf(this) == Brightness.light
        ? lightValue
        : darkValue;
  }
}
