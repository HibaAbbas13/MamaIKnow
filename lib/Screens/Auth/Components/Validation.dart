class CustomValidator {
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (!RegExp(
            r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$')
        .hasMatch(value)) {
      return 'Password must be alphanumeric, have a special character, and be at least 8 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
