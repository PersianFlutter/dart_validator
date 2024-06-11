import 'package:dart_validator/dart_validator.dart';

class AlphabeticalValidator extends FormValidator {
  AlphabeticalValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    RegExp alphabeticalRegex = RegExp(r'^[a-zA-Z]+$');
    if (value != null &&
        value.isNotEmpty &&
        !alphabeticalRegex.hasMatch(value)) {
      return ValidatorMessages.alphabeticalError;
    }
    return nextValidator?.validate(value);
  }
}
