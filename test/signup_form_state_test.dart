import 'package:flutter_test/flutter_test.dart';
import 'package:taskone/features/auth/application/signup_form_state.dart';

void main() {
  test(
    'canSubmit is true when required fields and checkboxes are complete',
    () {
      const state = SignUpFormState(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john@demo.com',
        password: '123456',
        country: 'United States',
        acceptConditions: true,
        acceptHealthProcessing: true,
      );

      expect(state.canSubmit, isTrue);
    },
  );

  test('canSubmit is false when required checkboxes are not checked', () {
    const state = SignUpFormState(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john@demo.com',
      password: '123456',
      country: 'United States',
      acceptConditions: true,
      acceptHealthProcessing: false,
    );

    expect(state.canSubmit, isFalse);
  });
}
