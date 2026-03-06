import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/theme_context_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_button.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../application/login_form_controller.dart';
import 'signup_screen.dart';
import '../widgets/auth_footer_prompt.dart';
import '../widgets/auth_page_background.dart';
import '../widgets/auth_social_buttons_row.dart';
import '../widgets/auth_underline_input.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginFormControllerProvider);
    final controller = ref.read(loginFormControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AuthPageBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            trailing: SvgPicture.asset(
                              AppAssets.iconMail,
                              width: 20.w,
                              height: 20.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          AuthUnderlineInput(
                            label: 'PASSWORD',
                            obscureText: state.obscurePassword,
                            textInputAction: TextInputAction.done,
                            onChanged: controller.onPasswordChanged,
                            trailing: GestureDetector(
                              onTap: controller.togglePasswordVisibility,
                              child: SvgPicture.asset(
                                AppAssets.iconEye,
                                width: 20.w,
                                height: 20.w,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
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
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'FORGOT YOUR PASSWORD?',
                                style: context.appText.caps12.copyWith(
                                  color: AppColors.mutedText,
                                  letterSpacing: 2.1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.03),
                          FractionallySizedBox(
                            widthFactor: 0.8,
                            alignment: Alignment.center,
                            child: AppGlassButton(
                              label: 'SIGN IN',
                              height: 50.w,
                              recipe: AppEffects.frostedWhiteBlur30Strong,
                              borderColor: Color(0x80FFFFFF),
                              labelFontSize: 19,
                              isLoading: state.isSubmitting,
                              onPressed: state.canSubmit
                                  ? () async {
                                      await controller.submit();
                                      if (!context.mounted) {
                                        return;
                                      }
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute<void>(
                                          builder: (_) => const HomeScreen(),
                                        ),
                                      );
                                    }
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 34),
                          Text(
                            'OR',
                            textAlign: TextAlign.center,
                            style: context.appText.caps18.copyWith(
                              color: AppColors.white,
                              letterSpacing: 4,
                            ),
                          ),
                          const SizedBox(height: 26),
                          const AuthSocialButtonsRow(),
                          const SizedBox(height: 12),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: AuthFooterPrompt(
                              prompt: "DON'T HAVE AN ACCOUNT?",
                              actionText: 'JOIN NOW',
                              onActionPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (_) => const SignUpScreen(),
                                  ),
                                );
                              },
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
      ),
    );
  }
}
