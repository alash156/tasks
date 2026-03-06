import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class AuthPageBackground extends StatelessWidget {
  const AuthPageBackground({
    super.key,
    required this.child,
    this.backgroundAsset = AppAssets.authBackground,
  });

  final Widget child;
  final String backgroundAsset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          backgroundAsset,
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.pageOverlayTop,
                AppColors.pageOverlayBottom,
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
