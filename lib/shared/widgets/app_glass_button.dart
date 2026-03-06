import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_effects.dart';
import '../../core/theme/app_typography.dart';
import 'app_glass_container.dart';

class AppGlassButton extends StatelessWidget {
  const AppGlassButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 88,
    this.isLoading = false,
    this.recipe = AppEffects.darkGlassBlur30ShadowLarge,
    this.borderColor = const Color(0x59FFFFFF),
    this.labelFontSize,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final bool isLoading;
  final AppSurfaceRecipe recipe;
  final Color borderColor;
  final double? labelFontSize;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: AppGlassContainer(
        recipe: recipe,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onPressed,
            child: SizedBox(
              height: height,
              width: double.infinity,
              child: Center(
                child: isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: AppColors.white,
                        ),
                      )
                    : Text(
                        label.toUpperCase(),
                        style: AppTypography.caps24.copyWith(
                          color: AppColors.white,
                          letterSpacing: 4,
                          fontSize: labelFontSize,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
