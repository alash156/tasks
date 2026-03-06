import 'package:flutter_test/flutter_test.dart';
import 'package:taskone/features/auth/application/login_form_state.dart';

void main() {
  test('canSubmit is true when email and password are not empty', () {
    const state = LoginFormState(email: 'test@example.com', password: 'secret');

    expect(state.canSubmit, isTrue);
  });

  test('canSubmit is false while submitting', () {
    const state = LoginFormState(
      email: 'test@example.com',
      password: 'secret',
      isSubmitting: true,
    );

    expect(state.canSubmit, isFalse);
  });
}
