import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class AppSurfaceRecipe {
  const AppSurfaceRecipe({
    required this.backgroundColor,
    this.blur = 0,
    this.shadows = const <BoxShadow>[],
  });

  final Color backgroundColor;
  final double blur;
  final List<BoxShadow> shadows;

  BoxDecoration decoration({BorderRadius? borderRadius, BoxBorder? border}) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadows,
    );
  }

  ImageFilter? get backdropFilter {
    if (blur <= 0) {
      return null;
    }

    final sigma = _figmaBlurToSigma(blur);
    return ImageFilter.blur(sigmaX: sigma, sigmaY: sigma);
  }

  static double _figmaBlurToSigma(double blur) {
    return blur * 0.57735 + 0.5;
  }
}

class AppEffects {
  AppEffects._();

  static const Color overlayBlack12 = Color(0x1F000000); // #0000001F
  static const Color overlayWhite12 = Color(0x1FFFFFFF); // #FFFFFF1F
  static const Color surfaceWhite = Color(0xFFFFFFFF); // #FFFFFF

  static const BoxShadow shadowLarge = BoxShadow(
    color: Color(0x26000000), // #00000026
    offset: Offset(3, 3),
    blurRadius: 20,
    spreadRadius: 0,
  );

  static const BoxShadow shadowSmall = BoxShadow(
    color: Color(0x26000000), // #00000026
    offset: Offset(2, 2),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static const BoxShadow shadowTop = BoxShadow(
    color: Color(0x40000000), // #00000040
    offset: Offset(0, -20),
    blurRadius: 20,
    spreadRadius: 0,
  );

  static const AppSurfaceRecipe darkGlassBlur30ShadowLarge = AppSurfaceRecipe(
    backgroundColor: overlayBlack12,
    blur: 30,
    shadows: <BoxShadow>[shadowLarge],
  );

  static const AppSurfaceRecipe darkGlassBlur30 = AppSurfaceRecipe(
    backgroundColor: overlayBlack12,
    blur: 30,
  );

  static const AppSurfaceRecipe whiteSurfaceShadowSmall = AppSurfaceRecipe(
    backgroundColor: surfaceWhite,
    shadows: <BoxShadow>[shadowSmall],
  );

  static const AppSurfaceRecipe darkGlassBlur10 = AppSurfaceRecipe(
    backgroundColor: overlayBlack12,
    blur: 10,
  );

  static const AppSurfaceRecipe whiteSurfaceShadowLarge = AppSurfaceRecipe(
    backgroundColor: surfaceWhite,
    shadows: <BoxShadow>[shadowLarge],
  );

  static const AppSurfaceRecipe darkSurfaceTopShadow = AppSurfaceRecipe(
    backgroundColor: overlayBlack12,
    shadows: <BoxShadow>[shadowTop],
  );

  static const AppSurfaceRecipe glassWhite = AppSurfaceRecipe(
    backgroundColor: overlayWhite12,
  );
}
