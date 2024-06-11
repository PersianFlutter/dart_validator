import 'package:dart_validator/dart_validator.dart';

class FormValidation {
  static String? Function(String?) validate(List<FormValidator> validators) {
    return (String? value) {
      for (var validator in validators.reversed) {
        var error = validator.validate(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }
}
