import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AuthSelectField extends StatelessWidget {
  const AuthSelectField({
    super.key,
    required this.label,
    required this.onTap,
    this.value,
  });

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final displayText = (value?.trim().isNotEmpty ?? false) ? value! : label;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    displayText.toUpperCase(),
                    style: AppTypography.caps16.copyWith(
                      color: AppColors.labelText,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                  size: 26.w,
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.inputLine),
        ],
      ),
    );
  }
}
