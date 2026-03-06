import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Century Gothic';

  static TextStyle _regular(double fontSize, double lineHeight) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      height: lineHeight / fontSize,
    );
  }

  static final TextStyle regular12 = _regular(12, 14);
  static final TextStyle regular14 = _regular(14, 16);
  static final TextStyle regular16 = _regular(16, 18);
  static final TextStyle regular20 = _regular(20, 22);
  static final TextStyle regular24 = _regular(24, 32);
  static final TextStyle regular30 = _regular(30, 38);
  static final TextStyle regular38 = _regular(38, 46);
  static final TextStyle regular46 = _regular(46, 54);
  static final TextStyle regular56 = _regular(56, 64);

  static final TextStyle caps8 = _regular(8, 10);
  static final TextStyle caps10 = _regular(10, 12);
  static final TextStyle caps12 = _regular(12, 15);
  static final TextStyle caps14 = _regular(14, 16);
  static final TextStyle caps16 = _regular(16, 18);
  static final TextStyle caps18 = _regular(18, 20);
  static final TextStyle caps24 = _regular(24, 28);
  static final TextStyle caps40 = _regular(40, 44);

  static TextTheme get materialTextTheme => TextTheme(
    displayLarge: regular56,
    displayMedium: regular46,
    displaySmall: regular38,
    headlineLarge: regular30,
    headlineMedium: regular24,
    headlineSmall: regular20,
    titleLarge: regular16,
    titleMedium: regular14,
    titleSmall: regular12,
    bodyLarge: regular16,
    bodyMedium: regular14,
    bodySmall: regular12,
    labelLarge: caps14,
    labelMedium: caps12,
    labelSmall: caps10,
  );

  static AppTextStyles get appTextStyles => AppTextStyles(
    regular12: regular12,
    regular14: regular14,
    regular16: regular16,
    regular20: regular20,
    regular24: regular24,
    regular30: regular30,
    regular38: regular38,
    regular46: regular46,
    regular56: regular56,
    caps8: caps8,
    caps10: caps10,
    caps12: caps12,
    caps14: caps14,
    caps16: caps16,
    caps18: caps18,
    caps24: caps24,
    caps40: caps40,
  );
}

@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.regular12,
    required this.regular14,
    required this.regular16,
    required this.regular20,
    required this.regular24,
    required this.regular30,
    required this.regular38,
    required this.regular46,
    required this.regular56,
    required this.caps8,
    required this.caps10,
    required this.caps12,
    required this.caps14,
    required this.caps16,
    required this.caps18,
    required this.caps24,
    required this.caps40,
  });

  final TextStyle regular12;
  final TextStyle regular14;
  final TextStyle regular16;
  final TextStyle regular20;
  final TextStyle regular24;
  final TextStyle regular30;
  final TextStyle regular38;
  final TextStyle regular46;
  final TextStyle regular56;
  final TextStyle caps8;
  final TextStyle caps10;
  final TextStyle caps12;
  final TextStyle caps14;
  final TextStyle caps16;
  final TextStyle caps18;
  final TextStyle caps24;
  final TextStyle caps40;

  @override
  AppTextStyles copyWith({
    TextStyle? regular12,
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? regular20,
    TextStyle? regular24,
    TextStyle? regular30,
    TextStyle? regular38,
    TextStyle? regular46,
    TextStyle? regular56,
    TextStyle? caps8,
    TextStyle? caps10,
    TextStyle? caps12,
    TextStyle? caps14,
    TextStyle? caps16,
    TextStyle? caps18,
    TextStyle? caps24,
    TextStyle? caps40,
  }) {
    return AppTextStyles(
      regular12: regular12 ?? this.regular12,
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      regular20: regular20 ?? this.regular20,
      regular24: regular24 ?? this.regular24,
      regular30: regular30 ?? this.regular30,
      regular38: regular38 ?? this.regular38,
      regular46: regular46 ?? this.regular46,
      regular56: regular56 ?? this.regular56,
      caps8: caps8 ?? this.caps8,
      caps10: caps10 ?? this.caps10,
      caps12: caps12 ?? this.caps12,
      caps14: caps14 ?? this.caps14,
      caps16: caps16 ?? this.caps16,
      caps18: caps18 ?? this.caps18,
      caps24: caps24 ?? this.caps24,
      caps40: caps40 ?? this.caps40,
    );
  }

  @override
  AppTextStyles lerp(covariant ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }

    return AppTextStyles(
      regular12: TextStyle.lerp(regular12, other.regular12, t) ?? regular12,
      regular14: TextStyle.lerp(regular14, other.regular14, t) ?? regular14,
      regular16: TextStyle.lerp(regular16, other.regular16, t) ?? regular16,
      regular20: TextStyle.lerp(regular20, other.regular20, t) ?? regular20,
      regular24: TextStyle.lerp(regular24, other.regular24, t) ?? regular24,
      regular30: TextStyle.lerp(regular30, other.regular30, t) ?? regular30,
      regular38: TextStyle.lerp(regular38, other.regular38, t) ?? regular38,
      regular46: TextStyle.lerp(regular46, other.regular46, t) ?? regular46,
      regular56: TextStyle.lerp(regular56, other.regular56, t) ?? regular56,
      caps8: TextStyle.lerp(caps8, other.caps8, t) ?? caps8,
      caps10: TextStyle.lerp(caps10, other.caps10, t) ?? caps10,
      caps12: TextStyle.lerp(caps12, other.caps12, t) ?? caps12,
      caps14: TextStyle.lerp(caps14, other.caps14, t) ?? caps14,
      caps16: TextStyle.lerp(caps16, other.caps16, t) ?? caps16,
      caps18: TextStyle.lerp(caps18, other.caps18, t) ?? caps18,
      caps24: TextStyle.lerp(caps24, other.caps24, t) ?? caps24,
      caps40: TextStyle.lerp(caps40, other.caps40, t) ?? caps40,
    );
  }
}
