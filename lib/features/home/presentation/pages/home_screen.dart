import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';
import '../widgets/home_action_tile.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_section_title.dart';
import '../widgets/home_top_bar.dart';

final homeBottomNavIndexProvider =
    NotifierProvider<HomeBottomNavIndexNotifier, int>(
      HomeBottomNavIndexNotifier.new,
    );
final homeFanLevelProvider = NotifierProvider<HomeFanLevelNotifier, int>(
  HomeFanLevelNotifier.new,
);

class HomeBottomNavIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}

class HomeFanLevelNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void setLevel(int level) {
    state = level;
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(homeBottomNavIndexProvider);
    final fanLevel = ref.watch(homeFanLevelProvider);

    const controls = <_ControlItem>[
      _ControlItem(
        iconAsset: AppAssets.iconCurtain,
        title: 'Curtains',
        subtitle: 'Open 75%',
      ),
      _ControlItem(
        iconAsset: AppAssets.iconNightLight,
        title: 'Night Light',
        subtitle: 'Enabled',
      ),
      _ControlItem(
        iconAsset: AppAssets.iconBalcony,
        title: 'Balcony',
        subtitle: 'Closed',
      ),
      _ControlItem(
        iconAsset: AppAssets.iconLamp,
        title: 'Main Lamp',
        subtitle: 'Warm',
      ),
      _ControlItem(
        iconAsset: AppAssets.iconCandle,
        title: 'Aroma',
        subtitle: 'Sandalwood',
      ),
      _ControlItem(
        iconAsset: AppAssets.iconService,
        title: 'Room Service',
        subtitle: 'Available',
      ),
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            AppAssets.authBackground,
            fit: BoxFit.cover,
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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 8.h, bottom: 128.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const HomeTopBar(),
                    SizedBox(height: 28.h),
                    Text(
                      'WELCOME BACK,\nJAYASOM GUEST',
                      style: AppTypography.caps24.copyWith(
                        color: AppColors.white,
                        letterSpacing: 4.4.w,
                        height: 1.35,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppGlassContainer(
                      recipe: AppEffects.darkGlassBlur30ShadowLarge,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: const Color(0x59FFFFFF)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 44.w,
                            height: 44.w,
                            decoration: BoxDecoration(
                              color: const Color(0x2BFFFFFF),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppAssets.iconClimateControl,
                                width: 24.w,
                                height: 24.w,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'CLIMATE CONTROL',
                                  style: AppTypography.caps12.copyWith(
                                    color: AppColors.mutedText,
                                    letterSpacing: 2.w,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '24°C  •  HUMIDITY 58%',
                                  style: AppTypography.regular16.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            AppAssets.iconSun,
                            width: 24.w,
                            height: 24.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const HomeSectionTitle(title: 'Quick Controls'),
                    SizedBox(height: 12.h),
                    GridView.builder(
                      itemCount: controls.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1.26,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final item = controls[index];
                        return HomeActionTile(
                          iconAsset: item.iconAsset,
                          title: item.title,
                          subtitle: item.subtitle,
                          isHighlighted: index == 1,
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    const HomeSectionTitle(title: 'Fan Speed'),
                    SizedBox(height: 12.h),
                    AppGlassContainer(
                      recipe: AppEffects.darkGlassBlur10,
                      borderRadius: BorderRadius.circular(22.r),
                      border: Border.all(color: const Color(0x4DFFFFFF)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        children: List<Widget>.generate(3, (int index) {
                          final iconAsset = switch (index) {
                            0 => AppAssets.iconFanLow,
                            1 => AppAssets.iconFanMid,
                            _ => AppAssets.iconFanMax,
                          };
                          final label = switch (index) {
                            0 => 'LOW',
                            1 => 'MEDIUM',
                            _ => 'MAX',
                          };
                          final isSelected = fanLevel == index;

                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: _FanSpeedTile(
                                iconAsset: iconAsset,
                                label: label,
                                isSelected: isSelected,
                                onTap: () {
                                  ref
                                      .read(homeFanLevelProvider.notifier)
                                      .setLevel(index);
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const HomeSectionTitle(title: 'Today Services'),
                    SizedBox(height: 12.h),
                    _ServiceTile(
                      iconAsset: AppAssets.iconHanger,
                      title: 'WARDROBE PREP',
                      subtitle: 'Requested • 8:30 AM',
                    ),
                    SizedBox(height: 10.h),
                    _ServiceTile(
                      iconAsset: AppAssets.iconService,
                      title: 'IN-ROOM MASSAGE',
                      subtitle: 'Scheduled • 6:00 PM',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 14.h,
            child: SafeArea(
              top: false,
              child: HomeBottomNav(
                currentIndex: navIndex,
                onTap: (int index) {
                  ref.read(homeBottomNavIndexProvider.notifier).setIndex(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
  });

  final String iconAsset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.darkGlassBlur10,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: const Color(0x4DFFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        children: <Widget>[
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: const Color(0x2EFFFFFF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Image.asset(iconAsset, width: 22.w, height: 22.w),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: AppTypography.caps12.copyWith(
                    color: AppColors.white,
                    letterSpacing: 1.8.w,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: AppTypography.regular14.copyWith(
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FanSpeedTile extends StatelessWidget {
  const _FanSpeedTile({
    required this.iconAsset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String iconAsset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0x30FFFFFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: <Widget>[
                Image.asset(iconAsset, width: 30.w, height: 30.w),
                SizedBox(height: 6.h),
                Text(
                  label,
                  style: AppTypography.caps10.copyWith(
                    color: AppColors.white,
                    letterSpacing: 1.4.w,
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

class _ControlItem {
  const _ControlItem({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
}
