import 'package:flutter/material.dart';
import 'package:theme_package/src/models/models.dart';

/// {@template color_theme}
/// Color theme for the application
/// Provides a consistent set of color palettes used throughout the app.
/// Each palette includes multiple shades for flexibility in design.
/// {@endtemplate}
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  /// {@macro color_theme}
  const AppColorTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.danger,
    required this.neutral,
  });

  /// Primary color palette
  final AppColor primary;

  /// Secondary color palette
  final AppColor secondary;

  /// Tertiary color palette
  final AppColor tertiary;

  /// Danger color palette
  final AppColor danger;

  /// Neutral color palette
  final AppColor neutral;

  /// Default light theme
  static const AppColorTheme light = AppColorTheme(
    primary: AppColor(
      shade50: Color(0xFFF1F8FB),
      shade100: Color(0xFFCCD9E1),
      shade200: Color(0xFF99B2C3),
      shade300: Color(0xFF668CA5),
      shade400: Color(0xFF336587),
      shade500: Color(0xFF003F69),
      shade600: Color(0xFF003254),
      shade700: Color(0xFF00263F),
      shade800: Color(0xFF00192A),
      shade900: Color(0xFF000D15),
      shade950: Color(0xFF00060A),
    ),
    secondary: AppColor(
      shade50: Color(0xFFEEF6E4),
      shade100: Color(0xFFE0ECCC),
      shade200: Color(0xFFC3D99E),
      shade300: Color(0xFFA6C76F),
      shade400: Color(0xFF89B441),
      shade500: Color(0xFF6CA112),
      shade600: Color(0xFF56810E),
      shade700: Color(0xFF41610B),
      shade800: Color(0xFF2B4007),
      shade900: Color(0xFF162004),
      shade950: Color(0xFF0B1002),
    ),
    tertiary: AppColor(
      shade50: Color(0xFFFCF4EB),
      shade100: Color(0xFFF9E9D8),
      shade200: Color(0xFFF4D3B0),
      shade300: Color(0xFFEEBD89),
      shade400: Color(0xFFE9A761),
      shade500: Color(0xFFE3913A),
      shade600: Color(0xFFB6742E),
      shade700: Color(0xFF885723),
      shade800: Color(0xFF5B3A17),
      shade900: Color(0xFF2D1D0C),
      shade950: Color(0xFF170E06),
    ),
    danger: AppColor(
      shade50: Color(0xFFFEF2F2),
      shade100: Color(0xFFFFE2E2),
      shade200: Color(0xFFFFC9C9),
      shade300: Color(0xFFFFA2A2),
      shade400: Color(0xFFFF6467),
      shade500: Color(0xFFFB2C36),
      shade600: Color(0xFFE7000B),
      shade700: Color(0xFFC10007),
      shade800: Color(0xFF9F0712),
      shade900: Color(0xFF82181A),
      shade950: Color(0xFF460809),
    ),
    neutral: AppColor(
      shade50: Color(0xFFF9FAFB),
      shade100: Color(0xFFF3F4F6),
      shade200: Color(0xFFE5E7EB),
      shade300: Color(0xFFD1D5DB),
      shade400: Color(0xFF9CA3AF),
      shade500: Color(0xFF6B7280),
      shade600: Color(0xFF4B5563),
      shade700: Color(0xFF374151),
      shade800: Color(0xFF1F2937),
      shade900: Color(0xFF111827),
      shade950: Color(0xFF030712),
    ),
  );

  @override
  ThemeExtension<AppColorTheme> copyWith({
    AppColor? primary,
    AppColor? secondary,
    AppColor? tertiary,
    AppColor? danger,
    AppColor? neutral,
  }) {
    return AppColorTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      danger: danger ?? this.danger,
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    covariant ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) {
      return this;
    }
    return AppColorTheme(
      primary: AppColor(
        shade50: Color.lerp(primary.shade50, other.primary.shade50, t)!,
        shade100: Color.lerp(primary.shade100, other.primary.shade100, t)!,
        shade200: Color.lerp(primary.shade200, other.primary.shade200, t)!,
        shade300: Color.lerp(primary.shade300, other.primary.shade300, t)!,
        shade400: Color.lerp(primary.shade400, other.primary.shade400, t)!,
        shade500: Color.lerp(primary.shade500, other.primary.shade500, t)!,
        shade600: Color.lerp(primary.shade600, other.primary.shade600, t)!,
        shade700: Color.lerp(primary.shade700, other.primary.shade700, t)!,
        shade800: Color.lerp(primary.shade800, other.primary.shade800, t)!,
        shade900: Color.lerp(primary.shade900, other.primary.shade900, t)!,
        shade950: Color.lerp(primary.shade950, other.primary.shade950, t)!,
      ),
      secondary: AppColor(
        shade50: Color.lerp(secondary.shade50, other.secondary.shade50, t)!,
        shade100: Color.lerp(secondary.shade100, other.secondary.shade100, t)!,
        shade200: Color.lerp(secondary.shade200, other.secondary.shade200, t)!,
        shade300: Color.lerp(secondary.shade300, other.secondary.shade300, t)!,
        shade400: Color.lerp(secondary.shade400, other.secondary.shade400, t)!,
        shade500: Color.lerp(secondary.shade500, other.secondary.shade500, t)!,
        shade600: Color.lerp(secondary.shade600, other.secondary.shade600, t)!,
        shade700: Color.lerp(secondary.shade700, other.secondary.shade700, t)!,
        shade800: Color.lerp(secondary.shade800, other.secondary.shade800, t)!,
        shade900: Color.lerp(secondary.shade900, other.secondary.shade900, t)!,
        shade950: Color.lerp(secondary.shade950, other.secondary.shade950, t)!,
      ),
      tertiary: AppColor(
        shade50: Color.lerp(tertiary.shade50, other.tertiary.shade50, t)!,
        shade100: Color.lerp(tertiary.shade100, other.tertiary.shade100, t)!,
        shade200: Color.lerp(tertiary.shade200, other.tertiary.shade200, t)!,
        shade300: Color.lerp(tertiary.shade300, other.tertiary.shade300, t)!,
        shade400: Color.lerp(tertiary.shade400, other.tertiary.shade400, t)!,
        shade500: Color.lerp(tertiary.shade500, other.tertiary.shade500, t)!,
        shade600: Color.lerp(tertiary.shade600, other.tertiary.shade600, t)!,
        shade700: Color.lerp(tertiary.shade700, other.tertiary.shade700, t)!,
        shade800: Color.lerp(tertiary.shade800, other.tertiary.shade800, t)!,
        shade900: Color.lerp(tertiary.shade900, other.tertiary.shade900, t)!,
        shade950: Color.lerp(tertiary.shade950, other.tertiary.shade950, t)!,
      ),
      danger: AppColor(
        shade50: Color.lerp(danger.shade50, other.danger.shade50, t)!,
        shade100: Color.lerp(danger.shade100, other.danger.shade100, t)!,
        shade200: Color.lerp(danger.shade200, other.danger.shade200, t)!,
        shade300: Color.lerp(danger.shade300, other.danger.shade300, t)!,
        shade400: Color.lerp(danger.shade400, other.danger.shade400, t)!,
        shade500: Color.lerp(danger.shade500, other.danger.shade500, t)!,
        shade600: Color.lerp(danger.shade600, other.danger.shade600, t)!,
        shade700: Color.lerp(danger.shade700, other.danger.shade700, t)!,
        shade800: Color.lerp(danger.shade800, other.danger.shade800, t)!,
        shade900: Color.lerp(danger.shade900, other.danger.shade900, t)!,
        shade950: Color.lerp(danger.shade950, other.danger.shade950, t)!,
      ),
      neutral: AppColor(
        shade50: Color.lerp(neutral.shade50, other.neutral.shade50, t)!,
        shade100: Color.lerp(neutral.shade100, other.neutral.shade100, t)!,
        shade200: Color.lerp(neutral.shade200, other.neutral.shade200, t)!,
        shade300: Color.lerp(neutral.shade300, other.neutral.shade300, t)!,
        shade400: Color.lerp(neutral.shade400, other.neutral.shade400, t)!,
        shade500: Color.lerp(neutral.shade500, other.neutral.shade500, t)!,
        shade600: Color.lerp(neutral.shade600, other.neutral.shade600, t)!,
        shade700: Color.lerp(neutral.shade700, other.neutral.shade700, t)!,
        shade800: Color.lerp(neutral.shade800, other.neutral.shade800, t)!,
        shade900: Color.lerp(neutral.shade900, other.neutral.shade900, t)!,
        shade950: Color.lerp(neutral.shade950, other.neutral.shade950, t)!,
      ),
    );
  }
}
