import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  bool _mainCategoriesExpanded = true;
  bool _wellnessHubExpanded = true;
  bool _myRequestsExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.9.sw,
      elevation: 0,
      backgroundColor: const Color(0xFF5E5E5E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(28.r)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(28.r)),
        child: Container(
          color: const Color(0xFF5E5E5E),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24.w, 18.h, 20.w, 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 22.h),
                    _DrawerProfileCard(onMenuTap: widget.onClose),
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
                    _ExpandableDrawerSection(
                      title: 'MAIN CATEGORIES',
                      icon: Icons.grid_view_outlined,
                      isExpanded: _mainCategoriesExpanded,
                      onToggle: () {
                        setState(() {
                          _mainCategoriesExpanded = !_mainCategoriesExpanded;
                        });
                      },
                      items: const <_DrawerMenuItemData>[
                        _DrawerMenuItemData(
                          icon: Icons.bed_outlined,
                          title: 'My Stay',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.dashboard_outlined,
                          title: 'Dashboard',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.calendar_month_outlined,
                          title: 'Bookings',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    _ExpandableDrawerSection(
                      title: 'WELLNESS HUB',
                      icon: Icons.spa_outlined,
                      isExpanded: _wellnessHubExpanded,
                      onToggle: () {
                        setState(() {
                          _wellnessHubExpanded = !_wellnessHubExpanded;
                        });
                      },
                      items: const <_DrawerMenuItemData>[
                        _DrawerMenuItemData(
                          icon: Icons.favorite_border_rounded,
                          title: 'MyHealth',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.assignment_outlined,
                          title: 'Questionnaires',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    _ExpandableDrawerSection(
                      title: 'MY REQUESTS',
                      icon: Icons.edit_note_rounded,
                      isExpanded: _myRequestsExpanded,
                      onToggle: () {
                        setState(() {
                          _myRequestsExpanded = !_myRequestsExpanded;
                        });
                      },
                      items: const <_DrawerMenuItemData>[
                        _DrawerMenuItemData(
                          icon: Icons.support_agent_outlined,
                          title: 'Concierge',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.cleaning_services_outlined,
                          title: 'Housekeeping',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.room_service_outlined,
                          title: 'Room Service',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.handyman_outlined,
                          title: 'Maintenance Service',
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.directions_car_filled_outlined,
                          title: 'Transportation',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'OPO WELLNESS',
                      icon: Icons.music_note_outlined,
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'CHILDREN TRACKER',
                      icon: Icons.child_care_outlined,
                    ),
                    SizedBox(height: 20.h),
                    const _DrawerDivider(),
                    SizedBox(height: 20.h),
                    const _DrawerSectionHeader(
                      title: 'LOG OUT',
                      icon: Icons.logout_rounded,
                      titleColor: Color(0xFFFF6B6B),
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

class _DrawerProfileCard extends StatelessWidget {
  const _DrawerProfileCard({required this.onMenuTap});

  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.frostedWhiteBlur30,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.r),
        bottomLeft: Radius.circular(32.r),
        topRight: Radius.circular(18.r),
        bottomRight: Radius.circular(18.r),
      ),
      border: Border.all(color: const Color(0x76FFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
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
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}

class _ExpandableDrawerSection extends StatelessWidget {
  const _ExpandableDrawerSection({
    required this.title,
    required this.icon,
    required this.isExpanded,
    required this.onToggle,
    required this.items,
  });

  final String title;
  final IconData icon;
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<_DrawerMenuItemData> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _DrawerSectionHeader(
          title: title,
          icon: icon,
          isExpandable: true,
          isExpanded: isExpanded,
          onTap: onToggle,
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: Column(
              children: <Widget>[
                for (int index = 0; index < items.length; index++) ...<Widget>[
                  _DrawerItem(
                    icon: items[index].icon,
                    title: items[index].title,
                  ),
                  if (index != items.length - 1) SizedBox(height: 16.h),
                ],
              ],
            ),
          ),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 180),
          sizeCurve: Curves.easeOutCubic,
        ),
        SizedBox(height: 20.h),
        const _DrawerDivider(),
      ],
    );
  }
}

class _DrawerMenuItemData {
  const _DrawerMenuItemData({required this.icon, required this.title});

  final IconData icon;
  final String title;
}

class _DrawerSectionHeader extends StatelessWidget {
  const _DrawerSectionHeader({
    required this.title,
    required this.icon,
    this.isExpandable = false,
    this.isExpanded = false,
    this.onTap,
    this.titleColor = AppColors.white,
  });

  final String title;
  final IconData icon;
  final bool isExpandable;
  final bool isExpanded;
  final VoidCallback? onTap;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: <Widget>[
        Icon(icon, color: AppColors.white, size: 24.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: AppTypography.caps24.copyWith(
              color: titleColor,
              fontSize: 16.sp,
              letterSpacing: 4.1.w,
            ),
          ),
        ),
        if (isExpandable)
          AnimatedRotation(
            turns: isExpanded ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.white,
              size: 34.sp,
            ),
          ),
      ],
    );

    if (!isExpandable) {
      return row;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: row,
        ),
      ),
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
