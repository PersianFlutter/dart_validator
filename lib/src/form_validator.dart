import 'package:dart_validator/src/validator_messages.dart';

abstract class FormValidator {
  FormValidator? nextValidator;
  FormValidator({
    this.nextValidator,
  });
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorMessages.emptyError;
    }
    return nextValidator?.validate(value);
  }
}
