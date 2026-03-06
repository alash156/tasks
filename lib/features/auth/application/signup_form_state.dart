class SignUpFormState {
  const SignUpFormState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.country = '',
    this.obscurePassword = true,
    this.acceptConditions = false,
    this.acceptHealthProcessing = false,
    this.isSubmitting = false,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String country;
  final bool obscurePassword;
  final bool acceptConditions;
  final bool acceptHealthProcessing;
  final bool isSubmitting;

  bool get canSubmit {
    return firstName.trim().isNotEmpty &&
        lastName.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        password.isNotEmpty &&
        country.trim().isNotEmpty &&
        acceptConditions &&
        acceptHealthProcessing &&
        !isSubmitting;
  }

  SignUpFormState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? country,
    bool? obscurePassword,
    bool? acceptConditions,
    bool? acceptHealthProcessing,
    bool? isSubmitting,
  }) {
    return SignUpFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      country: country ?? this.country,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      acceptConditions: acceptConditions ?? this.acceptConditions,
      acceptHealthProcessing:
          acceptHealthProcessing ?? this.acceptHealthProcessing,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
