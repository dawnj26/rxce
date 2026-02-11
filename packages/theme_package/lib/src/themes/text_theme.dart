import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template app_text_theme}
/// Text theme for the application
///
/// Provides a consistent set of text styles used throughout the app.
/// All styles use the Montserrat font family from Google Fonts.
/// {@endtemplate}
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// {@macro app_text_theme}
  const AppTextTheme({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.heading5,
    required this.heading6,
    required this.labelExtraSmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.paragraphExtraSmall,
    required this.paragraphLarge,
    required this.paragraphMedium,
    required this.paragraphSmall,
  });

  /// Default light theme
  AppTextTheme.light()
    : fontFamily = 'Montserrat',
      heading1 = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 36,
        height: 44 / 36,
        fontVariations: [FontVariation('wght', 400)],
      ),
      heading2 = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 32,
        height: 40 / 32,
        fontVariations: [FontVariation('wght', 400)],
      ),
      heading3 = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 28,
        height: 36 / 28,
        fontVariations: [FontVariation('wght', 400)],
      ),
      heading4 = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24,
        height: 32 / 24,
        fontVariations: [FontVariation('wght', 400)],
      ),
      heading5 = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        height: 28 / 20,
        fontVariations: [FontVariation('wght', 400)],
      ),
      heading6 = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        height: 24 / 18,
        fontVariations: [FontVariation('wght', 400)],
      ),
      paragraphLarge = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        height: 28 / 18,
        fontVariations: [FontVariation('wght', 400)],
      ),
      paragraphMedium = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        height: 24 / 16,
        fontVariations: [FontVariation('wght', 400)],
      ),
      paragraphSmall = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        height: 20 / 14,
        fontVariations: [FontVariation('wght', 400)],
      ),
      paragraphExtraSmall = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        height: 20 / 12,
        fontVariations: [FontVariation('wght', 400)],
      ),
      labelLarge = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        height: 18 / 16,
        fontVariations: [FontVariation('wght', 400)],
      ),
      labelMedium = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        height: 16 / 14,
        fontVariations: [FontVariation('wght', 400)],
      ),
      labelSmall = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        height: 16 / 12,
        fontVariations: [FontVariation('wght', 400)],
      ),
      labelExtraSmall = const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10,
        height: 16 / 10,
        fontVariations: [FontVariation('wght', 400)],
      );

  /// Font family used for all text styles
  final String fontFamily;

  /// Extra large heading style
  final TextStyle heading1;

  /// Large heading style
  final TextStyle heading2;

  /// Medium-large heading style
  final TextStyle heading3;

  /// Medium heading style
  final TextStyle heading4;

  /// Small heading style
  final TextStyle heading5;

  /// Extra small heading style
  final TextStyle heading6;

  /// Large paragraph style
  final TextStyle paragraphLarge;

  /// Medium paragraph style
  final TextStyle paragraphMedium;

  /// Small paragraph style
  final TextStyle paragraphSmall;

  /// Extra small paragraph style
  final TextStyle paragraphExtraSmall;

  /// Large label style
  final TextStyle labelLarge;

  /// Medium label style
  final TextStyle labelMedium;

  /// Small label style
  final TextStyle labelSmall;

  /// Extra small label style
  final TextStyle labelExtraSmall;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? labelExtraSmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? paragraphExtraSmall,
    TextStyle? paragraphLarge,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSmall,
    String? fontFamily,
  }) {
    return AppTextTheme(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      heading6: heading6 ?? this.heading6,
      labelExtraSmall: labelExtraSmall ?? this.labelExtraSmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      paragraphExtraSmall: paragraphExtraSmall ?? this.paragraphExtraSmall,
      paragraphLarge: paragraphLarge ?? this.paragraphLarge,
      paragraphMedium: paragraphMedium ?? this.paragraphMedium,
      paragraphSmall: paragraphSmall ?? this.paragraphSmall,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme(
      heading1: TextStyle.lerp(heading1, other.heading1, t)!,
      heading2: TextStyle.lerp(heading2, other.heading2, t)!,
      heading3: TextStyle.lerp(heading3, other.heading3, t)!,
      heading4: TextStyle.lerp(heading4, other.heading4, t)!,
      heading5: TextStyle.lerp(heading5, other.heading5, t)!,
      heading6: TextStyle.lerp(heading6, other.heading6, t)!,
      labelExtraSmall: TextStyle.lerp(
        labelExtraSmall,
        other.labelExtraSmall,
        t,
      )!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      paragraphExtraSmall: TextStyle.lerp(
        paragraphExtraSmall,
        other.paragraphExtraSmall,
        t,
      )!,
      paragraphLarge: TextStyle.lerp(paragraphLarge, other.paragraphLarge, t)!,
      paragraphMedium: TextStyle.lerp(
        paragraphMedium,
        other.paragraphMedium,
        t,
      )!,
      paragraphSmall: TextStyle.lerp(paragraphSmall, other.paragraphSmall, t)!,
    );
  }
}
