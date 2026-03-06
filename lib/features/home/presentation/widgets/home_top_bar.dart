import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, this.onMenuTap, this.onNotificationTap});

  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _HomeIconButton(iconAsset: AppAssets.iconMenu, onTap: onMenuTap),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            'JAYASOM',
            textAlign: TextAlign.center,
            style: AppTypography.caps16.copyWith(
              color: AppColors.white,
              letterSpacing: 4.w,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        _HomeIconButton(
          iconAsset: AppAssets.iconBell,
          onTap: onNotificationTap,
        ),
      ],
    );
  }
}

class _HomeIconButton extends StatelessWidget {
  const _HomeIconButton({required this.iconAsset, required this.onTap});

  final String iconAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.darkGlassBlur10,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: const Color(0x59FFFFFF)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: SizedBox(
            width: 48.w,
            height: 48.w,
            child: Center(
              child: SvgPicture.asset(
                iconAsset,
                width: 22.w,
                height: 22.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
