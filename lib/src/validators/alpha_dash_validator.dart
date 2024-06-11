import 'package:dart_validator/dart_validator.dart';

class AlphaDashValidator extends FormValidator {
  AlphaDashValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    RegExp alphaDashRegex = RegExp(r'^[a-zA-Z-_]+$');
    if (value != null && value.isNotEmpty && !alphaDashRegex.hasMatch(value)) {
      return ValidatorMessages.alphabetDashError;
    }
    return nextValidator?.validate(value);
  }
}
