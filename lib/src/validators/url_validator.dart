import 'package:dart_validator/dart_validator.dart';

class UrlValidator extends FormValidator {
  UrlValidator({super.nextValidator});
  static final RegExp _urlRegex = RegExp(
    r'^(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$',
    caseSensitive: false,
  );

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!_urlRegex.hasMatch(value)) {
      return ValidatorMessages.urlError;
    }

    return null;
  }
}
