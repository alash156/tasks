import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<String> _icons = <String>[
    AppAssets.iconHome,
    AppAssets.iconBed,
    AppAssets.iconBook,
    AppAssets.iconWellness,
    AppAssets.iconSupport,
  ];

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.darkSurfaceTopShadow,
      borderRadius: BorderRadius.circular(28.r),
      border: Border.all(color: const Color(0x52FFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Row(
        children: List<Widget>.generate(_icons.length, (int index) {
          final isActive = index == currentIndex;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: _NavIconButton(
                iconAsset: _icons[index],
                isActive: isActive,
                onTap: () => onTap(index),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavIconButton extends StatelessWidget {
  const _NavIconButton({
    required this.iconAsset,
    required this.isActive,
    required this.onTap,
  });

  final String iconAsset;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        color: isActive ? const Color(0x30FFFFFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: SizedBox(
            height: 52.h,
            child: Center(
              child: Opacity(
                opacity: isActive ? 1 : 0.72,
                child: Image.asset(iconAsset, width: 24.w, height: 24.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
