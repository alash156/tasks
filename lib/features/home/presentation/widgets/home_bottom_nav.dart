import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<_NavItemData> _items = <_NavItemData>[
    _NavItemData(iconAsset: AppAssets.iconHome, label: 'HOME'),
    _NavItemData(iconAsset: AppAssets.iconBook, label: 'BOOK'),
    _NavItemData(iconAsset: AppAssets.iconBed, label: 'MY STAY'),
    _NavItemData(iconAsset: AppAssets.iconWellness, label: 'WELLNESS'),
    _NavItemData(iconAsset: AppAssets.iconSupport, label: 'SUPPORT'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.frostedWhiteBlur30Strong,
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: const Color(0x76FFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: List<Widget>.generate(_items.length, (int index) {
          final isActive = index == currentIndex;
          final item = _items[index];

          return Expanded(
            child: _NavButton(
              item: item,
              isActive: isActive,
              onTap: () => onTap(index),
            ),
          );
        }),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final _NavItemData item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          height: 66.h,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isActive ? const Color(0x24FFFFFF) : Colors.transparent,
                borderRadius: BorderRadius.circular(14.r),
                border: isActive
                    ? Border.all(color: const Color(0x5AFFFFFF))
                    : null,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    item.iconAsset,
                    width: isActive ? 24.w : 22.w,
                    height: isActive ? 24.w : 22.w,
                    color: isActive ? AppColors.white : const Color(0xA8FFFFFF),
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item.label,
                    style: AppTypography.caps10.copyWith(
                      color: isActive
                          ? AppColors.white
                          : const Color(0xB8FFFFFF),
                      fontSize: isActive ? 10.sp : 9.sp,
                      letterSpacing: 1.5.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData({required this.iconAsset, required this.label});

  final String iconAsset;
  final String label;
}
