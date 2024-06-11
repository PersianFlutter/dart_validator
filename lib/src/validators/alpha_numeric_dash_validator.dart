import 'package:dart_validator/dart_validator.dart';

class AlphaNumericDashValidator extends FormValidator {
  AlphaNumericDashValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)) {
      return ValidatorMessages.alphaNumericDashError;
    }
    return nextValidator?.validate(value);
  }
}
