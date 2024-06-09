import 'package:dart_validator/dart_validator.dart';
import 'package:dart_validator/src/validator_messages.dart';

class IpValidator extends FormValidator {
  IpValidator({super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      final parts = value.split('.');
      if (parts.length != 4) {
        return ValidatorMessages.ipError;
      }
      for (final part in parts) {
        try {
          final number = int.parse(part);
          if (number < 0 || number > 255) {
            return ValidatorMessages.ipError;
          }
        } catch (e) {
          return ValidatorMessages.ipError;
        }
      }
    }
    return nextValidator?.validate(value);
  }
}
