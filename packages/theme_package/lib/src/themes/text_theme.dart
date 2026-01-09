import 'package:flutter/material.dart';

/// Text theme for the application
class TTextTheme {
  TTextTheme._();

  /// Font family used throughout the app
  static const String fontFamily = 'Montserrat';

  /// Light text theme
  static TextTheme get lightTextTheme {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 28,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 24,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        height: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
