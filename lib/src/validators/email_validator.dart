import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class EmailValidator extends FormValidator {
  EmailValidator({
    super.nextValidator,
  });

  @override
  String? validate(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return ValidatorMessages.emailWrongError;
    }
    return nextValidator?.validate(value);
  }
}
