import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class HomeActionTile extends StatelessWidget {
  const HomeActionTile({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.isHighlighted = false,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.darkGlassBlur30ShadowLarge,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(
        color: isHighlighted
            ? const Color(0x9CFFFFFF)
            : const Color(0x59FFFFFF),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: const Color(0x2EFFFFFF),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      iconAsset,
                      width: 22.w,
                      height: 22.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  title.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.caps12.copyWith(
                    color: AppColors.white,
                    letterSpacing: 1.8.w,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.regular14.copyWith(
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
