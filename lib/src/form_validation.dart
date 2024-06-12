import 'package:dart_validator/dart_validator.dart';
import 'dart:mirrors';

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

  static String? Function(String?) typeValidate(List<Type> validators) {
    assert(validators.every((type) => type is FormValidator),
        'All validators must be a type of FormValidator');

    return (String? value) {
      for (var validatorType in validators.reversed) {
        var validatorClassMirror = reflectClass(validatorType);
        var validator = validatorClassMirror
            .newInstance(Symbol(''), []).reflectee as FormValidator;

        var error = validator.validate(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  static String? Function(String?) dynamicValidate(List<dynamic> validators) {
    assert(
        validators.every(
            (validator) => validator is Type || validator is FormValidator),
        'All validators must be a type or an instance of FormValidator');

    return (String? value) {
      for (var validator in validators.reversed) {
        FormValidator validatorInstance;
        if (validator is Type) {
          var validatorClassMirror = reflectClass(validator);
          validatorInstance = validatorClassMirror
              .newInstance(Symbol(''), []).reflectee as FormValidator;
        } else  {
          validatorInstance = validator;
        }

        var error = validatorInstance.validate(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }
}
