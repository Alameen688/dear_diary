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
    return null;
  }
}