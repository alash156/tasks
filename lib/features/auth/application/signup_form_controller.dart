import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'signup_form_state.dart';

const List<String> signUpCountryOptions = <String>[
  'United States',
  'United Kingdom',
  'Nepal',
  'Thailand',
  'United Arab Emirates',
  'India',
  'Australia',
];

final signUpFormControllerProvider =
    NotifierProvider<SignUpFormController, SignUpFormState>(
      SignUpFormController.new,
    );

class SignUpFormController extends Notifier<SignUpFormState> {
  @override
  SignUpFormState build() {
    return const SignUpFormState();
  }

  void onFirstNameChanged(String value) {
    state = state.copyWith(firstName: value);
  }

  void onLastNameChanged(String value) {
    state = state.copyWith(lastName: value);
  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: value);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value);
  }

  void onCountryChanged(String value) {
    state = state.copyWith(country: value);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void onAcceptConditionsChanged(bool value) {
    state = state.copyWith(acceptConditions: value);
  }

  void onAcceptHealthProcessingChanged(bool value) {
    state = state.copyWith(acceptHealthProcessing: value);
  }

  Future<void> submit() async {
    if (!state.canSubmit) {
      return;
    }

    state = state.copyWith(isSubmitting: true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    state = state.copyWith(isSubmitting: false);
  }
}
