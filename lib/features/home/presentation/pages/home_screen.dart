import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_container.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_drawer.dart';

final homeBottomNavIndexProvider =
    NotifierProvider<HomeBottomNavIndexNotifier, int>(
      HomeBottomNavIndexNotifier.new,
    );
final homeSelectedSceneProvider =
    NotifierProvider<HomeSelectedSceneNotifier, int>(
      HomeSelectedSceneNotifier.new,
    );

class HomeBottomNavIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}

class HomeSelectedSceneNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setSelected(int index) {
    state = index;
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final navIndex = ref.watch(homeBottomNavIndexProvider);
    final selectedScene = ref.watch(homeSelectedSceneProvider);

    const scenes = <_SceneItem>[
      _SceneItem(
        title: 'MASTER',
        iconAsset: AppAssets.iconLamp,
        accent: Color(0xFFF0C777),
      ),
      _SceneItem(
        title: 'MOOD',
        iconAsset: AppAssets.iconCandle,
        accent: Color(0xFFF0C777),
      ),
      _SceneItem(
        title: 'NIGHT LIGHT',
        iconAsset: AppAssets.iconNightLight,
        accent: Color(0xFFF0C777),
      ),
      _SceneItem(
        title: 'PRIVACY',
        iconAsset: AppAssets.iconCurtain,
        accent: Color(0xFFEEA28D),
      ),
      _SceneItem(
        title: 'BRIGHT',
        iconAsset: AppAssets.iconSun,
        accent: Color(0xFFF0C777),
      ),
      _SceneItem(
        title: 'SERVICE',
        iconAsset: AppAssets.iconService,
        accent: Color(0xFF9FD5D2),
      ),
      _SceneItem(
        title: 'TERRACE',
        iconAsset: AppAssets.iconBalcony,
        accent: Color(0xFFF0C777),
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(onClose: () => Navigator.of(context).pop()),
      drawerScrimColor: const Color(0x5E000000),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0x52000000), Color(0x6E000000)],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(1.08, 1.02),
                radius: 0.52,
                colors: <Color>[Color(0x7B7A5E3B), Colors.transparent],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 4.h, bottom: 134.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 26.h),
                    _ProfileHeaderCard(
                      onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'VILLA 123',
                          style: AppTypography.caps24.copyWith(
                            color: AppColors.white,
                            fontSize: 21.sp,
                            letterSpacing: 4.2.w,
                          ),
                        ),
                        Text(
                          '26°C',
                          style: AppTypography.regular46.copyWith(
                            color: AppColors.white,
                            fontSize: 24.sp,
                            letterSpacing: 0.8.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.lightbulb_outline_rounded,
                          color: AppColors.white,
                          size: 34.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'LIGHTING & SCENES',
                            style: AppTypography.caps24.copyWith(
                              color: AppColors.white,
                              fontSize: 18.sp,
                              letterSpacing: 3.4.w,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: AppColors.white,
                          size: 42.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'LIVING ROOM',
                      style: AppTypography.regular56.copyWith(
                        color: AppColors.white,
                        fontSize: 34.sp,
                        letterSpacing: 1.4.w,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    GridView.builder(
                      itemCount: scenes.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 1.25,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final scene = scenes[index];
                        return _SceneTile(
                          item: scene,
                          isSelected: selectedScene == index,
                          onTap: () {
                            ref
                                .read(homeSelectedSceneProvider.notifier)
                                .setSelected(index);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    const _FanControlPanel(),
                    SizedBox(height: 28.h),
                    const _RoomSelector(),
                    SizedBox(height: 22.h),
                    const _DividerLine(),
                    SizedBox(height: 20.h),
                    const _ExpandableControlRow(
                      iconAsset: AppAssets.iconClimateControl,
                      title: 'CLIMATE CONTROL',
                    ),
                    SizedBox(height: 20.h),
                    const _DividerLine(),
                    SizedBox(height: 20.h),
                    const _ExpandableControlRow(
                      iconAsset: AppAssets.iconCurtain,
                      title: 'CURTAINS & BLINDS',
                    ),
                    SizedBox(height: 20.h),
                    const _DividerLine(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 4.w,
            top: 0.44.sh,
            child: Container(
              width: 7.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: const Color(0x6BFFFFFF),
                borderRadius: BorderRadius.circular(8.r),
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

class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard({required this.onMenuTap});

  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.frostedWhiteBlur30,
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: const Color(0x70FFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              AppAssets.profileAvatar,
              width: 68.w,
              height: 68.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'MR.',
                  style: AppTypography.caps16.copyWith(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    letterSpacing: 3.4.w,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'CHARLEY BROWN',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.caps24.copyWith(
                    color: AppColors.white,
                    fontSize: 17.sp,
                    letterSpacing: 3.6.w,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
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
                top: -8.h,
                right: -6.w,
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
                      style: AppTypography.regular14.copyWith(
                        color: const Color(0xFF2B353B),
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onMenuTap,
              borderRadius: BorderRadius.circular(10.r),
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Image.asset(
                  AppAssets.iconMenu,
                  width: 34.w,
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SceneTile extends StatelessWidget {
  const _SceneTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final _SceneItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.frostedWhiteBlur30,
      borderRadius: BorderRadius.circular(24.r),
      border: Border.all(
        color: isSelected ? const Color(0x96FFFFFF) : const Color(0x62BFD0D8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 26.w,
                  height: 26.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: item.accent.withValues(alpha: 0.4),
                        blurRadius: 16.r,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      item.iconAsset,
                      width: 21.w,
                      height: 21.w,
                      color: item.accent,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    item.title,
                    maxLines: 1,
                    style: AppTypography.caps24.copyWith(
                      color: item.accent,
                      fontSize: 13.sp,
                      letterSpacing: 1.5.w,
                    ),
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

class _FanControlPanel extends StatelessWidget {
  const _FanControlPanel();

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      recipe: AppEffects.frostedWhiteBlur30Strong,
      borderRadius: BorderRadius.circular(28.r),
      border: Border.all(color: const Color(0x82FFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          _FanOption(
            iconAsset: AppAssets.iconFanLow,
            title: 'Low',
            color: AppColors.white,
          ),
          _FanOption(
            iconAsset: AppAssets.iconFanMid,
            title: 'Ceiling Fan',
            color: Color(0xFFB9ECFF),
            glow: false,
          ),
          _FanOption(
            iconAsset: AppAssets.iconFanMax,
            title: 'High',
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}

class _FanOption extends StatelessWidget {
  const _FanOption({
    required this.iconAsset,
    required this.title,
    required this.color,
    this.glow = false,
  });

  final String iconAsset;
  final String title;
  final Color color;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: glow
                  ? <BoxShadow>[
                      BoxShadow(
                        color: color.withValues(alpha: 0.62),
                        blurRadius: 14.r,
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Image.asset(
                iconAsset,
                width: 33.w,
                height: 33.w,
                color: color,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTypography.regular24.copyWith(
              color: color,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoomSelector extends StatelessWidget {
  const _RoomSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _RoomArrowButton(
          icon: Icons.chevron_left_rounded,
          color: const Color(0xA6D6CDC3),
          iconColor: const Color(0xA34A4A4A),
          onTap: () {},
        ),
        SizedBox(width: 26.w),
        Text(
          'BEDROOM',
          style: AppTypography.caps24.copyWith(
            color: AppColors.white,
            fontSize: 18.sp,
            letterSpacing: 3.0.w,
          ),
        ),
        SizedBox(width: 26.w),
        _RoomArrowButton(
          icon: Icons.chevron_right_rounded,
          color: const Color(0xF1F3F0EB),
          iconColor: const Color(0xA34A4A4A),
          onTap: () {},
        ),
      ],
    );
  }
}

class _RoomArrowButton extends StatelessWidget {
  const _RoomArrowButton({
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: SizedBox(
          width: 54.w,
          height: 54.w,
          child: Icon(icon, color: iconColor, size: 30.sp),
        ),
      ),
    );
  }
}

class _ExpandableControlRow extends StatelessWidget {
  const _ExpandableControlRow({required this.iconAsset, required this.title});

  final String iconAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          iconAsset,
          width: 30.w,
          height: 30.w,
          color: AppColors.white,
          colorBlendMode: BlendMode.srcIn,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: AppTypography.caps24.copyWith(
              color: AppColors.white,
              fontSize: 18.sp,
              letterSpacing: 3.4.w,
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.white,
          size: 42.sp,
        ),
      ],
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.h,
      color: const Color(0x66FFFFFF),
    );
  }
}

class _SceneItem {
  const _SceneItem({
    required this.title,
    required this.iconAsset,
    required this.accent,
  });

  final String title;
  final String iconAsset;
  final Color accent;
}
