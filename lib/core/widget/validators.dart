class AppValidators {
  AppValidators._();

  // Validate Email
  static String? validateEmail(String? val) {
    final email = val?.trim() ?? '';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate Password
  static String? validatePassword(String? val) {
    final password = val ?? '';

    if (password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Validate Confirm Password
  static String? validateConfirmPassword(String? val, String? password) {
    final confirmPassword = val ?? '';

    if (confirmPassword.isEmpty) {
      return 'Please re-enter your password';
    } else if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validate Full Name / Username
  static String? validateFullName(String? val) {
    final name = val?.trim() ?? '';

    if (name.isEmpty) {
      return 'Please enter your full name';
    } else if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  // Validate Phone Number
  static String? validatePhoneNumber(String? val) {
    final phone = val?.trim() ?? '';
    final phoneRegex = RegExp(r'^[0-9]{11}$');

    if (phone.isEmpty) {
      return 'Please enter your phone number';
    } else if (!phoneRegex.hasMatch(phone)) {
      return 'Phone number must be exactly 11 digits';
    }
    return null;
  }
}