import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class LengthValidator extends FormValidator {
  final int min;
  final int max;

  LengthValidator({this.min = 0, this.max = 100, super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length < min || value.length > max) {
        return ValidatorMessages.lengthMessage(min, max);
      }
    }
    return nextValidator?.validate(value);
  }
}
