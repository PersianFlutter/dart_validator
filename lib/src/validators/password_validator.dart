import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class PasswordValidator extends FormValidator {
  final int minLength = 6;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasDigit;
  final bool specialChars;
  PasswordValidator(
      {this.hasUpperCase = true,
      this.hasLowerCase = true,
      this.hasDigit = true,
      this.specialChars = true,
      super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length < minLength) {
        return 'Password must be at least $minLength characters long';
      }
      if (hasUpperCase && !value.contains(RegExp(r'[A-Z]'))) {
        return ValidatorMessages.passwordUpperCaseError;
      }
      if (hasLowerCase && !value.contains(RegExp(r'[a-z]'))) {
        return ValidatorMessages.passwordLowerCaseError;
      }
      if (hasDigit && !value.contains(RegExp(r'[0-9]'))) {
        return ValidatorMessages.passwordNumberError;
      }
      if (specialChars && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return ValidatorMessages.passwordSpecialCharError;
      }
    }
    return nextValidator?.validate(value);
  }
}
