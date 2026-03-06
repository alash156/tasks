import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

extension ThemeContextExtension on BuildContext {
  AppTextStyles get appText {
    return Theme.of(this).extension<AppTextStyles>() ??
        AppTypography.appTextStyles;
  }
}
