import 'package:flutter/material.dart';
import 'package:theme_package/src/themes/themes.dart';

/// Extension on BuildContext to easily access custom theme extensions
extension ThemeExtension on BuildContext {
  /// Accessor for AppColorTheme
  AppColorTheme get appColor => Theme.of(this).extension<AppColorTheme>()!;

  /// Accessor for AppTextTheme
  AppTextTheme get appText => Theme.of(this).extension<AppTextTheme>()!;
}
