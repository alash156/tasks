import 'package:flutter/material.dart';

import '../../../../core/theme/app_effects.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.iconAsset,
    this.onTap,
    this.size = 64,
    this.iconSize = 30,
  });

  final String iconAsset;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.darkGlassBlur10,
      borderRadius: BorderRadius.circular(size / 2),
      border: Border.all(color: const Color(0x5CFFFFFF), width: 1.2),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Image.asset(
                iconAsset,
                width: iconSize,
                height: iconSize,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
