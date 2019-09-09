import 'package:email_validator/email_validator.dart';

class InputValidator {
  static String name(value) {
    if (value.isEmpty) {
      return 'Please provide your name!';
    }
    return null;
  }

  static String email(value) {
    if (value.isEmpty) {
      return 'Please provide your email address!';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email!';
    }
    return null;
  }

  static String password(value) {
    if (value.isEmpty) {
      return 'Please provide your password!';
    }
    if (value.length < 3 || value.length > 100) {
      return 'Password must be between 3 - 100 characters!';
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Sorry, special characters are not allowed!';
    }
    return null;
  }

  static String title(String value) {
    if (value.isEmpty) {
      return 'C\'mon, give me a headline!';
    }
    return null;
  }
  static String content(String value) {
    if (value.isEmpty) {
      return 'Hey! You haven\'t told me anything yet!';
    }
    return null;
  }
}
