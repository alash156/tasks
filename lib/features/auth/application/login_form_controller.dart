import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_form_state.dart';

final loginFormControllerProvider =
    NotifierProvider<LoginFormController, LoginFormState>(
      LoginFormController.new,
    );

class LoginFormController extends Notifier<LoginFormState> {
  @override
  LoginFormState build() {
    return const LoginFormState();
  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: value);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  Future<void> submit() async {
    if (!state.canSubmit) {
      return;
    }

    state = state.copyWith(isSubmitting: true);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    state = state.copyWith(isSubmitting: false);
  }
}
