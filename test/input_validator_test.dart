import 'package:flutter_test/flutter_test.dart';
import 'package:dear_diary/utils/input_validator.dart';

void main() {
  group('InputValidator.email', () {
    test('returns error when email is empty', () {
      expect(InputValidator.email(''), 'Please provide your email address!');
    });

    test('returns error when email is invalid', () {
      expect(InputValidator.email('invalid'), 'Please enter a valid email!');
    });

    test('returns null for valid email', () {
      expect(InputValidator.email('test@example.com'), isNull);
    });
  });

  group('InputValidator.password', () {
    test('returns error when password is empty', () {
      expect(InputValidator.password(''), 'Please provide your password!');
    });

    test('returns error when password is too short', () {
      expect(InputValidator.password('ab'), 'Password must be between 3 - 100 characters!');
    });

    test('returns error when password has special characters', () {
      expect(InputValidator.password('abc!'), 'Sorry, special characters are not allowed!');
    });

    test('returns null for valid password', () {
      expect(InputValidator.password('abc123'), isNull);
    });
  });

  group('InputValidator.name', () {
    test('returns error when name is empty', () {
      expect(InputValidator.name(''), 'Please provide your name!');
    });

    test('returns null for non-empty name', () {
      expect(InputValidator.name('Alice'), isNull);
    });
  });
}
