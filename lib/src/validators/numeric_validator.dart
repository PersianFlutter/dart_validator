import 'package:dart_validator/dart_validator.dart';

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
