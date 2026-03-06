import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/theme_context_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_glass_button.dart';
import '../../../../shared/widgets/app_glass_container.dart';
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
    final searchController = TextEditingController();
    String searchQuery = '';

    final selectedCountry = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A2229),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              final filteredCountries = signUpCountryOptions
                  .where(
                    (String country) => country.toLowerCase().contains(
                      searchQuery.trim().toLowerCase(),
                    ),
                  )
                  .toList(growable: false);

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.68,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 10.h),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 44.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: const Color(0x78FFFFFF),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      TextField(
                        controller: searchController,
                        onChanged: (String value) {
                          setModalState(() {
                            searchQuery = value;
                          });
                        },
                        style: AppTypography.regular16.copyWith(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                        cursorColor: AppColors.white,
                        decoration: InputDecoration(
                          hintText: 'Search country',
                          hintStyle: AppTypography.regular16.copyWith(
                            color: const Color(0xB5FFFFFF),
                            fontSize: 14.sp,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Color(0xCCFFFFFF),
                          ),
                          filled: true,
                          fillColor: const Color(0x1FFFFFFF),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(
                              color: Color(0x45FFFFFF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(
                              color: Color(0x8AFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Expanded(
                        child: filteredCountries.isEmpty
                            ? Center(
                                child: Text(
                                  'No country found',
                                  style: AppTypography.regular16.copyWith(
                                    color: AppColors.mutedText,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                itemCount: filteredCountries.length,
                                separatorBuilder: (_, __) => const Divider(
                                  height: 1,
                                  color: Color(0x3DFFFFFF),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  final country = filteredCountries[index];
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
                                        ? const Icon(
                                            Icons.check_rounded,
                                            color: AppColors.white,
                                          )
                                        : null,
                                    onTap: () =>
                                        Navigator.of(context).pop(country),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
    searchController.dispose();

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
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 62.h),
                          Text(
                            'WELCOME BACK TO\nJAYASOM WELLNESS',
                            textAlign: TextAlign.center,
                            style: AppTypography.caps24.copyWith(
                              color: AppColors.white,
                              fontSize: 24.sp,
                              letterSpacing: 5.w,
                              height: 1.45,
                            ),
                          ),
                          SizedBox(height: 62.h),
                          AuthUnderlineInput(
                            label: 'FIRST NAME',
                            onChanged: controller.onFirstNameChanged,
                            trailing: Image.asset(
                              AppAssets.iconUser,
                              color: AppColors.white,
                              colorBlendMode: BlendMode.srcIn,
                              width: 26.w,
                              height: 26.w,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          AuthUnderlineInput(
                            label: 'LAST NAME',
                            onChanged: controller.onLastNameChanged,
                            trailing: Image.asset(
                              AppAssets.iconUser,
                              color: AppColors.white,
                              colorBlendMode: BlendMode.srcIn,
                              width: 26.w,
                              height: 26.w,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          AuthUnderlineInput(
                            label: 'EMAIL',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: controller.onEmailChanged,
                            trailing: Image.asset(
                              AppAssets.iconMail,
                              color: AppColors.white,
                              colorBlendMode: BlendMode.srcIn,
                              width: 26.w,
                              height: 26.w,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          AuthUnderlineInput(
                            label: 'PASSWORD',
                            obscureText: state.obscurePassword,
                            textInputAction: TextInputAction.done,
                            onChanged: controller.onPasswordChanged,
                            trailing: IconButton(
                              onPressed: controller.togglePasswordVisibility,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              icon: Image.asset(
                                AppAssets.iconEye,
                                color: AppColors.white,
                                colorBlendMode: BlendMode.srcIn,
                                width: 26.w,
                                height: 26.w,
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
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
                          FractionallySizedBox(
                            widthFactor: 0.8,
                            alignment: Alignment.center,
                            child: AppGlassButton(
                              label: 'SIGN UP',
                              height: 50,
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
                                      final scaffoldMessenger =
                                          ScaffoldMessenger.of(context);
                                      scaffoldMessenger.hideCurrentSnackBar();
                                      final snackBarController =
                                          scaffoldMessenger.showSnackBar(
                                            SnackBar(
                                              content: AppGlassContainer(
                                                recipe: AppEffects
                                                    .frostedWhiteBlur30Strong,
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                border: Border.all(
                                                  color: const Color(
                                                    0x84FFFFFF,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 14.w,
                                                  vertical: 12.h,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .check_circle_outline,
                                                      color: AppColors.white,
                                                      size: 18.sp,
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Expanded(
                                                      child: Text(
                                                        'Signup Complete',
                                                        style: AppTypography
                                                            .regular16
                                                            .copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 14.sp,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              duration: const Duration(
                                                milliseconds: 1200,
                                              ),
                                              padding: EdgeInsets.zero,
                                              margin: EdgeInsets.fromLTRB(
                                                20.w,
                                                0,
                                                20.w,
                                                18.h,
                                              ),
                                              elevation: 0,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          );
                                      await snackBarController.closed;
                                      if (!context.mounted) {
                                        return;
                                      }
                                      if (Navigator.of(context).canPop()) {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  : null,
                            ),
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
