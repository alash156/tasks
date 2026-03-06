import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AuthUnderlineInput extends StatelessWidget {
  const AuthUnderlineInput({
    super.key,
    required this.label,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.trailing,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: AppTypography.caps16.copyWith(
            color: AppColors.white,
            letterSpacing: 4,
          ),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            isDense: true,
            hintText: label,
            hintStyle: AppTypography.caps16.copyWith(
              color: AppColors.labelText,
              letterSpacing: 4,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            suffixIcon: trailing == null
                ? null
                : Padding(
                    padding: const EdgeInsetsDirectional.only(start: 12),
                    child: trailing,
                  ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
          ),
        ),
        const Divider(height: 1, thickness: 1, color: AppColors.inputLine),
      ],
    );
  }
}
