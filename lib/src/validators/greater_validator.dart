import 'package:dart_validator/dart_validator.dart';

class GreaterValidator extends FormValidator {
  final num greater;
  GreaterValidator(this.greater);
  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      try {
        if (num.parse(value) <= greater) {
          return ValidatorMessages.greaterThanError(greater.toString());
        }
      } catch (e) {
        return ValidatorMessages.numberError;
      }
    }
    return nextValidator?.validate(value);
  }
}
