import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title.toUpperCase(),
            style: AppTypography.caps14.copyWith(
              color: AppColors.white,
              letterSpacing: 2.2.w,
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
