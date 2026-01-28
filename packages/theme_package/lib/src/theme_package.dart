import 'package:flutter/material.dart';
import 'package:theme_package/src/themes/themes.dart';

/// {@template theme_package}
/// A Flutter package providing theming capabilities for the RXCE application.
/// {@endtemplate}
class ThemePackage {
  const ThemePackage._();

  /// Default light theme data
  static ThemeData get light => ThemeData.light().copyWith(
    extensions: [
      AppColorTheme.light,
      AppTextTheme.light,
    ],
  );

  /// Default padding value
  static const double padding = 16;
}
