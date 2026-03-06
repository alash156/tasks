import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/theme_context_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_button.dart';
import '../../application/login_form_controller.dart';
import '../widgets/auth_underline_input.dart';
import '../widgets/social_auth_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginFormControllerProvider);
    final controller = ref.read(loginFormControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(AppAssets.loginBackground, fit: BoxFit.cover),
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
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: constraints.maxHeight * 0.14),
                            Text(
                              'WELCOME TO\nJAYASOM WELLNESS',
                              textAlign: TextAlign.center,
                              style: AppTypography.caps24.copyWith(
                                color: AppColors.white,
                                letterSpacing: 5.2,
                                height: 1.55,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.07),
                            AuthUnderlineInput(
                              label: 'EMAIL',
                              keyboardType: TextInputType.emailAddress,
                              onChanged: controller.onEmailChanged,
                              trailing: const Icon(
                                Icons.mail_outline_rounded,
                                color: AppColors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 30),
                            AuthUnderlineInput(
                              label: 'PASSWORD',
                              obscureText: state.obscurePassword,
                              textInputAction: TextInputAction.done,
                              onChanged: controller.onPasswordChanged,
                              trailing: IconButton(
                                onPressed: controller.togglePasswordVisibility,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                icon: Icon(
                                  state.obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.white,
                                  size: 31,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.white,
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'FORGOT YOUR PASSWORD?',
                                  style: context.appText.caps16.copyWith(
                                    color: AppColors.mutedText,
                                    letterSpacing: 2.1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            AppGlassButton(
                              label: 'SIGN IN',
                              isLoading: state.isSubmitting,
                              onPressed: state.canSubmit
                                  ? controller.submit
                                  : null,
                            ),
                            const SizedBox(height: 34),
                            Text(
                              'OR',
                              textAlign: TextAlign.center,
                              style: context.appText.caps24.copyWith(
                                color: AppColors.white,
                                letterSpacing: 4,
                              ),
                            ),
                            const SizedBox(height: 26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                SocialAuthButton(iconAsset: AppAssets.facebook),
                                SocialAuthButton(
                                  iconAsset: AppAssets.instagram,
                                ),
                                SocialAuthButton(iconAsset: AppAssets.google),
                                SocialAuthButton(iconAsset: AppAssets.apple),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10,
                                runSpacing: 2,
                                children: <Widget>[
                                  Text(
                                    "DON'T HAVE AN ACCOUNT?",
                                    textAlign: TextAlign.center,
                                    style: context.appText.caps16.copyWith(
                                      color: AppColors.mutedText,
                                      letterSpacing: 2.3,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      foregroundColor: AppColors.linkAccent,
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      'JOIN NOW',
                                      style: context.appText.caps16.copyWith(
                                        color: AppColors.linkAccent,
                                        letterSpacing: 2.3,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.linkAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
