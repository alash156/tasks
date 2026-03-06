import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.9.sw,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(28.r)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(28.r)),
        child: Container(
          color: const Color(0xF15E5E5E),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24.w, 18.h, 20.w, 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const _DrawerStatusRow(),
                    SizedBox(height: 22.h),
                    _DrawerProfileCard(onMenuTap: onClose),
                    SizedBox(height: 28.h),
                    Text(
                      'GOOD DAY,\nMR. CHARLEY',
                      style: AppTypography.caps24.copyWith(
                        color: AppColors.white,
                        fontSize: 26.sp,
                        letterSpacing: 4.8.w,
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    const _DrawerSectionHeader(
                      title: 'MAIN CATEGORIES',
                      icon: Icons.grid_view_outlined,
                      showArrow: true,
                    ),
                    SizedBox(height: 18.h),
                    const _DrawerItem(
                      icon: Icons.bed_outlined,
                      title: 'My Stay',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.dashboard_outlined,
                      title: 'Dashboard',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.calendar_month_outlined,
                      title: 'Bookings',
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'WELLNESS HUB',
                      icon: Icons.spa_outlined,
                      showArrow: true,
                    ),
                    SizedBox(height: 18.h),
                    const _DrawerItem(
                      icon: Icons.favorite_border_rounded,
                      title: 'MyHealth',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.assignment_outlined,
                      title: 'Questionnaires',
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'MY REQUESTS',
                      icon: Icons.edit_note_rounded,
                      showArrow: true,
                    ),
                    SizedBox(height: 18.h),
                    const _DrawerItem(
                      icon: Icons.support_agent_outlined,
                      title: 'Concierge',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.cleaning_services_outlined,
                      title: 'Housekeeping',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.room_service_outlined,
                      title: 'Room Service',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.handyman_outlined,
                      title: 'Maintenance Service',
                    ),
                    SizedBox(height: 16.h),
                    const _DrawerItem(
                      icon: Icons.directions_car_filled_outlined,
                      title: 'Transportation',
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'OPO WELLNESS',
                      icon: Icons.music_note_outlined,
                      showArrow: false,
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'CHILDREN TRACKER',
                      icon: Icons.child_care_outlined,
                      showArrow: false,
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                  ],
                ),
              ),
              Positioned(
                right: 8.w,
                top: 0.41.sh,
                child: Container(
                  width: 7.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: const Color(0x7AFFFFFF),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerStatusRow extends StatelessWidget {
  const _DrawerStatusRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '9:41',
          style: AppTypography.regular30.copyWith(
            color: AppColors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.signal_cellular_alt_rounded,
          color: AppColors.white,
          size: 17.sp,
        ),
        SizedBox(width: 6.w),
        Icon(Icons.wifi_rounded, color: AppColors.white, size: 18.sp),
        SizedBox(width: 6.w),
        Icon(Icons.battery_full_rounded, color: AppColors.white, size: 23.sp),
      ],
    );
  }
}

class _DrawerProfileCard extends StatelessWidget {
  const _DrawerProfileCard({required this.onMenuTap});

  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.frostedWhiteBlur30,
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: const Color(0x76FFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              AppAssets.profileAvatar,
              width: 66.w,
              height: 66.w,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Image.asset(
                AppAssets.iconBell,
                width: 28.w,
                height: 28.w,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: -7.h,
                right: -5.w,
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEA9F85),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '28',
                      style: AppTypography.regular12.copyWith(
                        color: const Color(0xFF2B353B),
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 18.w),
          InkWell(
            onTap: onMenuTap,
            borderRadius: BorderRadius.circular(10.r),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Image.asset(
                AppAssets.iconMenu,
                width: 34.w,
                height: 22.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerSectionHeader extends StatelessWidget {
  const _DrawerSectionHeader({
    required this.title,
    required this.icon,
    required this.showArrow,
  });

  final String title;
  final IconData icon;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: AppColors.white, size: 24.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: AppTypography.caps24.copyWith(
              color: AppColors.white,
              fontSize: 16.sp,
              letterSpacing: 4.1.w,
            ),
          ),
        ),
        if (showArrow)
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.white,
            size: 34.sp,
          ),
      ],
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 40.w),
        Icon(icon, color: AppColors.white, size: 24.sp),
        SizedBox(width: 14.w),
        Expanded(
          child: Text(
            title,
            style: AppTypography.regular20.copyWith(
              color: AppColors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawerDivider extends StatelessWidget {
  const _DrawerDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.h,
      color: const Color(0x4AFFFFFF),
    );
  }
}
