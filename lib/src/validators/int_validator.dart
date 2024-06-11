import 'package:dart_validator/dart_validator.dart';

class IntValidator extends FormValidator {
  IntValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      try {
        int.parse(value);
      } catch (e) {
        return ValidatorMessages.intError;
      }
    }
    return nextValidator?.validate(value);
  }
}
