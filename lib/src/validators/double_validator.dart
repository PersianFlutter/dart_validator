import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class DoubleValidator extends FormValidator {
  DoubleValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      try {
        double.parse(value);
      } catch (e) {
        return ValidatorMessages.doubleError;
      }
    }
    return nextValidator?.validate(value);
  }
}
