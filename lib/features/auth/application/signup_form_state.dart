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
    return validationErrors.isEmpty && !isSubmitting;
  }

  List<String> get validationErrors {
    final errors = <String>[];
    if (firstName.trim().isEmpty) errors.add('First name is required');
    if (lastName.trim().isEmpty) errors.add('Last name is required');
    if (email.trim().isEmpty) {
      errors.add('Email is required');
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email.trim())) {
      errors.add('Enter a valid email address');
    }
    if (password.isEmpty) {
      errors.add('Password is required');
    } else if (password.length < 6) {
      errors.add('Password must be at least 6 characters');
    }
    if (country.trim().isEmpty) errors.add('Country is required');
    if (!acceptConditions) errors.add('Accept the conditions of use');
    if (!acceptHealthProcessing) errors.add('Accept health data processing');
    return errors;
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
