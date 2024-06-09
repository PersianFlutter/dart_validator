import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class AlphaNumericValidator extends FormValidator {
  AlphaNumericValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    RegExp alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (value != null &&
        value.isNotEmpty &&
        !alphaNumericRegex.hasMatch(value)) {
      return ValidatorMessages.alphaNumericError;
    }
    return nextValidator?.validate(value);
  }
}
