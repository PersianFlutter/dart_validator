import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class NumericValidator extends FormValidator {
  NumericValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      try {
        num.parse(value);
      } catch (e) {
        return ValidatorMessages.numberError;
      }
    }
    return nextValidator?.validate(value);
  }
}
