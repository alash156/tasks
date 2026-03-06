import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import 'social_auth_button.dart';

class AuthSocialButtonsRow extends StatelessWidget {
  const AuthSocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      spacing: 32,
      runSpacing: 12,
      children: <Widget>[
        SocialAuthButton(iconAsset: AppAssets.facebook),
        SocialAuthButton(iconAsset: AppAssets.instagram),
        SocialAuthButton(iconAsset: AppAssets.google),
        SocialAuthButton(iconAsset: AppAssets.apple),
      ],
    );
  }
}
