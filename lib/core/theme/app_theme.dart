import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.linkAccent,
      onSecondary: AppColors.black,
      error: Color(0xFFEF4444),
      onError: AppColors.white,
      surface: Colors.transparent,
      onSurface: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: AppTypography.fontFamily,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: AppTypography.materialTextTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      dividerTheme: const DividerThemeData(color: AppColors.inputLine),
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      extensions: <ThemeExtension<dynamic>>[AppTypography.appTextStyles],
    );
  }
}
