import 'package:dart_validator/dart_validator.dart';

class LessValidator extends FormValidator {
  final num less;
  LessValidator(this.less, {super.nextValidator});

  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      try {
        if (num.parse(value) >= less) {
          return ValidatorMessages.lessThanError(less.toString());
        }
      } catch (e) {
        return ValidatorMessages.numberError;
      }
    }
    return nextValidator?.validate(value);
  }
}
