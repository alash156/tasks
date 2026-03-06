class LoginFormState {
  const LoginFormState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.isSubmitting = false,
  });

  final String email;
  final String password;
  final bool obscurePassword;
  final bool isSubmitting;

  bool get canSubmit =>
      email.trim().isNotEmpty && password.isNotEmpty && !isSubmitting;

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? obscurePassword,
    bool? isSubmitting,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
