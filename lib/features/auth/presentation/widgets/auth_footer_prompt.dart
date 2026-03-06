import 'package:flutter/material.dart';

import '../../../../core/extensions/theme_context_extension.dart';
import '../../../../core/theme/app_colors.dart';

class AuthFooterPrompt extends StatelessWidget {
  const AuthFooterPrompt({
    super.key,
    required this.prompt,
    required this.actionText,
    required this.onActionPressed,
  });

  final String prompt;
  final String actionText;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 2,
      children: <Widget>[
        Text(
          prompt,
          textAlign: TextAlign.center,
          style: context.appText.caps12.copyWith(
            color: AppColors.mutedText,
            letterSpacing: 2.3,
          ),
        ),
        TextButton(
          onPressed: onActionPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.linkAccent,
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            actionText,
            style: context.appText.caps12.copyWith(
              color: AppColors.linkAccent,
              letterSpacing: 2.3,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.linkAccent,
            ),
          ),
        ),
      ],
    );
  }
}
