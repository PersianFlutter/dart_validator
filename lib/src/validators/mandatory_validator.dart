import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class MandatoryValidator extends FormValidator {
  MandatoryValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorMessages.emptyError;
    }
    return nextValidator?.validate(value);
  }
}
