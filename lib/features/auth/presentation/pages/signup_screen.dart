import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/theme_context_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_button.dart';
import '../../application/signup_form_controller.dart';
import '../widgets/auth_checkbox_tile.dart';
import '../widgets/auth_footer_prompt.dart';
import '../widgets/auth_page_background.dart';
import '../widgets/auth_select_field.dart';
import '../widgets/auth_social_buttons_row.dart';
import '../widgets/auth_underline_input.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  Future<void> _pickCountry(
    BuildContext context,
    SignUpFormController controller,
    String currentCountry,
  ) async {
    final selectedCountry = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: const Color(0xFF1A2229),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: ListView.separated(
            itemCount: signUpCountryOptions.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: Color(0x3DFFFFFF)),
            itemBuilder: (BuildContext context, int index) {
              final country = signUpCountryOptions[index];
              final isSelected = country == currentCountry;

              return ListTile(
                title: Text(
                  country.toUpperCase(),
                  style: AppTypography.caps14.copyWith(
                    color: AppColors.white,
                    letterSpacing: 1.8,
                  ),
                ),
                trailing: isSelected
                    ? const Icon(Icons.check_rounded, color: AppColors.white)
                    : null,
                onTap: () => Navigator.of(context).pop(country),
              );
            },
          ),
        );
      },
    );

    if (selectedCountry == null) {
      return;
    }

    controller.onCountryChanged(selectedCountry);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpFormControllerProvider);
    final controller = ref.read(signUpFormControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AuthPageBackground(
        backgroundAsset: AppAssets.signUpBackground,
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
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: constraints.maxHeight * 0.07),
                          Text(
                            'WELCOME BACK TO\nJAYASOM WELLNESS',
                            textAlign: TextAlign.center,
                            style: AppTypography.caps24.copyWith(
                              color: AppColors.white,
                              letterSpacing: 5.2,
                              height: 1.55,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          AuthUnderlineInput(
                            label: 'FIRST NAME',
                            onChanged: controller.onFirstNameChanged,
                            trailing: const Icon(
                              Icons.person_outline_rounded,
                              color: AppColors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 28),
                          AuthUnderlineInput(
                            label: 'LAST NAME',
                            onChanged: controller.onLastNameChanged,
                            trailing: const Icon(
                              Icons.person_outline_rounded,
                              color: AppColors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 28),
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
                          const SizedBox(height: 28),
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
                          const SizedBox(height: 28),
                          AuthSelectField(
                            label: 'COUNTRY OF RESIDENCE',
                            value: state.country,
                            onTap: () => _pickCountry(
                              context,
                              controller,
                              state.country,
                            ),
                          ),
                          const SizedBox(height: 24),
                          AuthCheckboxTile(
                            value: state.acceptConditions,
                            label: 'I accept the Conditions of use',
                            onChanged: controller.onAcceptConditionsChanged,
                          ),
                          const SizedBox(height: 14),
                          AuthCheckboxTile(
                            value: state.acceptHealthProcessing,
                            label: 'I accept the processing of my health data',
                            onChanged:
                                controller.onAcceptHealthProcessingChanged,
                          ),
                          const SizedBox(height: 30),
                          AppGlassButton(
                            label: 'SIGN UP',
                            isLoading: state.isSubmitting,
                            onPressed: state.canSubmit
                                ? controller.submit
                                : null,
                          ),
                          const SizedBox(height: 28),
                          Text(
                            'OR',
                            textAlign: TextAlign.center,
                            style: context.appText.caps24.copyWith(
                              color: AppColors.white,
                              letterSpacing: 4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const AuthSocialButtonsRow(),
                          const SizedBox(height: 36),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: AuthFooterPrompt(
                              prompt: 'ALREADY HAVE AN ACCOUNT?',
                              actionText: 'SIGN IN',
                              onActionPressed: () {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                }
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
