import 'package:dart_validator/src/validator_messages.dart';
import 'package:dart_validator/src/validators/alpha_dash_validator.dart';
import 'package:dart_validator/src/validators/alpha_numeric_dash_validator.dart';
import 'package:dart_validator/src/validators/alpha_numeric_validator.dart';
import 'package:dart_validator/src/validators/alphabetic_validator.dart';
import 'package:dart_validator/src/validators/custom_validator.dart';
import 'package:dart_validator/src/validators/double_validator.dart';
import 'package:dart_validator/src/validators/email_validator.dart';
import 'package:dart_validator/src/validators/greater_validator.dart';
import 'package:dart_validator/src/validators/int_validator.dart';
import 'package:dart_validator/src/validators/ip_validator.dart';
import 'package:dart_validator/src/validators/length_validator.dart';
import 'package:dart_validator/src/validators/less_validator.dart';
import 'package:dart_validator/src/validators/mandatory_validator.dart';
import 'package:dart_validator/src/validators/numeric_validator.dart';
import 'package:dart_validator/src/validators/url_validator.dart';
import 'package:test/test.dart';

void main() {
  group('A group of validator tests', () {
    group("email validator", () {
      test('empty email validator', () {
        expect(EmailValidator().validate(""), equals(null));
      });
      test('null email validator', () {
        expect(EmailValidator().validate(null), equals(null));
      });
      test('wrong email validator', () {
        expect(EmailValidator().validate("John"),
            equals(ValidatorMessages.emailWrongError));
      });
      test('correct email validator', () {
        expect(EmailValidator().validate("John@example.com"), equals(null));
      });
    });
    group("mandatory validator", () {
      test('empty mandatory validator', () {
        expect(MandatoryValidator().validate(""),
            equals(ValidatorMessages.emptyError));
      });
      test('null mandatory validator', () {
        expect(MandatoryValidator().validate(null),
            equals(ValidatorMessages.emptyError));
      });
      test('correct mandatory validator', () {
        expect(MandatoryValidator().validate("A"), equals(null));
      });
    });
    group("alphabetical validator", () {
      test('empty alphabetical validator', () {
        expect(AlphabeticalValidator().validate(""), equals(null));
      });
      test('null alphabetical validator', () {
        expect(AlphabeticalValidator().validate(null), equals(null));
      });
      test('numeric alphabetical validator', () {
        expect(AlphabeticalValidator().validate("123"),
            equals(ValidatorMessages.alphabeticalError));
      });
      test('specific chars alphabetical validator', () {
        expect(AlphabeticalValidator().validate("ali_@"),
            equals(ValidatorMessages.alphabeticalError));
      });
      test('correct alphabetical validator', () {
        expect(AlphabeticalValidator().validate("A"), equals(null));
      });
    });
    group("alphaDash validator", () {
      test('empty alphaDash validator', () {
        expect(AlphaDashValidator().validate(""), equals(null));
      });
      test('null alphaDash validator', () {
        expect(AlphaDashValidator().validate(null), equals(null));
      });
      test('numeric alphaDash validator', () {
        expect(AlphaDashValidator().validate("123"),
            equals(ValidatorMessages.alphabetDashError));
      });
      test('specific chars alphaDash validator', () {
        expect(AlphaDashValidator().validate("ali@"),
            equals(ValidatorMessages.alphabetDashError));
      });
      test('correct alphabetical validator', () {
        expect(AlphaDashValidator().validate("A_"), equals(null));
      });
    });

    group("alphaNumericDash validator", () {
      test('empty alphaNumericDash validator', () {
        expect(AlphaNumericDashValidator().validate(""), equals(null));
      });
      test('null alphaNumericDash validator', () {
        expect(AlphaNumericDashValidator().validate(null), equals(null));
      });
      test('numeric alphaNumericDash validator', () {
        expect(AlphaNumericDashValidator().validate("123"), equals(null));
      });
      test('specific chars alphaNumericDash validator', () {
        expect(AlphaNumericDashValidator().validate("ali@"),
            equals(ValidatorMessages.alphaNumericDashError));
      });
      test('correct alphaNumericDash validator', () {
        expect(AlphaNumericDashValidator().validate("A_123"), equals(null));
      });
    });

    group("alphaNumeric validator", () {
      test('empty alphaNumeric validator', () {
        expect(AlphaNumericValidator().validate(""), equals(null));
      });
      test('null alphaNumeric validator', () {
        expect(AlphaNumericValidator().validate(null), equals(null));
      });
      test('numeric alphaNumeric validator', () {
        expect(AlphaNumericValidator().validate("123"), equals(null));
      });
      test('specific chars validator', () {
        expect(AlphaNumericValidator().validate("ali@"),
            equals(ValidatorMessages.alphaNumericError));
      });
      test('incorrect dash validator', () {
        expect(AlphaNumericValidator().validate("A_123"),
            equals(ValidatorMessages.alphaNumericError));
      });
      test('correct alpha numeric validator', () {
        expect(AlphaNumericValidator().validate("A123"), equals(null));
      });
    });
    group("int validator", () {
      test('int empty validator', () {
        expect(IntValidator().validate(""), equals(null));
      });
      test('int null validator', () {
        expect(IntValidator().validate(null), equals(null));
      });
      test('numeric int validator', () {
        expect(IntValidator().validate("123"), equals(null));
      });
      test('specific chars double validator', () {
        expect(IntValidator().validate("ali@"),
            equals(ValidatorMessages.intError));
      });
      test('incorrect double validator', () {
        expect(IntValidator().validate("22.33"),
            equals(ValidatorMessages.intError));
      });
    });
    group("double validator", () {
      test('double empty validator', () {
        expect(DoubleValidator().validate(""), equals(null));
      });
      test('double null validator', () {
        expect(DoubleValidator().validate(null), equals(null));
      });
      test('numeric double validator', () {
        expect(DoubleValidator().validate("123"), equals(null));
      });
      test('specific chars double validator', () {
        expect(DoubleValidator().validate("ali@"),
            equals(ValidatorMessages.doubleError));
      });
      test('correct double validator', () {
        expect(DoubleValidator().validate("22.33"), equals(null));
      });
      test('incorrect double validator', () {
        expect(DoubleValidator().validate("22,33"),
            equals(ValidatorMessages.doubleError));
      });
    });
    group("numeric validator", () {
      test('numeric empty validator', () {
        expect(NumericValidator().validate(""), equals(null));
      });
      test('double null validator', () {
        expect(NumericValidator().validate(null), equals(null));
      });
      test('numeric double validator', () {
        expect(NumericValidator().validate("123"), equals(null));
      });
      test('specific chars double validator', () {
        expect(NumericValidator().validate("ali@"),
            equals(ValidatorMessages.numberError));
      });
      test('correct double validator', () {
        expect(NumericValidator().validate("22.33"), equals(null));
      });
      test('incorrect double validator', () {
        expect(NumericValidator().validate("22,33"),
            equals(ValidatorMessages.numberError));
      });
    });
    group("less validator", () {
      test('less validator', () {
        expect(LessValidator(20).validate(""), equals(null));
      });
      test('greater null validator', () {
        expect(LessValidator(20).validate(null), equals(null));
      });
      test('numeric less validator', () {
        expect(LessValidator(20).validate("123"),
            equals(ValidatorMessages.lessThanError("20")));
      });
      test('specific chars less validator', () {
        expect(LessValidator(20).validate("ali@"),
            equals(ValidatorMessages.numberError));
      });
      test('correct double validator', () {
        expect(LessValidator(20).validate("19.99"), equals(null));
      });
      test('incorrect double validator', () {
        expect(GreaterValidator(20).validate("22,33"),
            equals(ValidatorMessages.numberError));
      });
      test('incorrect number validator', () {
        expect(LessValidator(20).validate("20"),
            equals(ValidatorMessages.lessThanError("20")));
      });
    });
    group("greater validator", () {
      test('greater validator', () {
        expect(GreaterValidator(20).validate(""), equals(null));
      });
      test('greater null validator', () {
        expect(GreaterValidator(20).validate(null), equals(null));
      });
      test('numeric double validator', () {
        expect(GreaterValidator(20).validate("123"), equals(null));
      });
      test('specific chars double validator', () {
        expect(GreaterValidator(20).validate("ali@"),
            equals(ValidatorMessages.numberError));
      });
      test('correct double validator', () {
        expect(GreaterValidator(20).validate("22.01"), equals(null));
      });
      test('incorrect double validator', () {
        expect(GreaterValidator(20).validate("22,33"),
            equals(ValidatorMessages.numberError));
      });
      test('incorrect number validator', () {
        expect(GreaterValidator(20).validate("19.33"),
            equals(ValidatorMessages.greaterThanError("20")));
      });
    });
    group("ip validator", () {
      test('ip validator', () {
        expect(IpValidator().validate(""), equals(null));
      });
      test('ip null validator', () {
        expect(IpValidator().validate(null), equals(null));
      });
      test('number ip validator', () {
        expect(
            IpValidator().validate("123"), equals(ValidatorMessages.ipError));
      });
      test('specific chars ip validator', () {
        expect(
            IpValidator().validate("ali@"), equals(ValidatorMessages.ipError));
      });
      test('double ip validator', () {
        expect(
            IpValidator().validate("22.01"), equals(ValidatorMessages.ipError));
      });
      test('incorrect double ip validator', () {
        expect(
            IpValidator().validate("22,33"), equals(ValidatorMessages.ipError));
      });
      test('incorrect number validator', () {
        expect(IpValidator().validate("19.33.12.1"), equals(null));
      });
      test('incorrect number validator', () {
        expect(IpValidator().validate("320.280.12.1"),
            equals(ValidatorMessages.ipError));
      });
    });
  });

  group("length validator", () {
    test('length empty validator', () {
      expect(LengthValidator().validate(""), equals(null));
    });
    test('length null validator', () {
      expect(LengthValidator().validate(null), equals(null));
    });
    test('normal text validator', () {
      expect(LengthValidator().validate("ali"), equals(null));
    });
    test('normal text validator with maximum fail', () {
      expect(LengthValidator(max: 2).validate("ali"),
          equals(ValidatorMessages.lengthMessage(0, 2)));
    });
    test('normal text validator with max', () {
      expect(LengthValidator(min: 20, max: 25).validate("ali"),
          equals(ValidatorMessages.lengthMessage(20, 25)));
    });
  });
  group("url validator", () {
    test('url empty validator', () {
      expect(UrlValidator().validate(""), equals(null));
    });
    test('url null validator', () {
      expect(UrlValidator().validate(null), equals(null));
    });
    test('normal text validator', () {
      expect(UrlValidator().validate("example"),
          equals(ValidatorMessages.urlError));
    });
    test('normal website validator', () {
      expect(UrlValidator().validate("example.com"), equals(null));
    });
    test('normal website with http', () {
      expect(UrlValidator().validate("http://example.com"), equals(null));
    });
    test('normal website with https', () {
      expect(UrlValidator().validate("https://example.com"), equals(null));
    });
    test('normal website using https with www', () {
      expect(UrlValidator().validate("https://www.example.com"), equals(null));
    });
    test('normal website without https with www', () {
      expect(UrlValidator().validate("www.example.com"), equals(null));
    });
    test('normal website with https with params', () {
      expect(
          UrlValidator().validate("https://example.com?x=1&12"), equals(null));
    });
    test('normal website with https with wrong params', () {
      expect(UrlValidator().validate("https://example.com?x=1&"), equals(null));
    });
    test('normal website with wrong https with www', () {
      expect(UrlValidator().validate("https:example.com"), equals(null));
    });
  });
  group('CustomValidation', () {
    test('empty string validation', () {
      var validator = CustomValidator(RegExp(r'.*'));
      expect(validator.validate(''), equals(null));
    });

    test('null string validation', () {
      var validator = CustomValidator(RegExp(r'.*'));
      expect(validator.validate(null), equals(null));
    });

    test('custom regex validation', () {
      var validator = CustomValidator(RegExp(r'^[a-z]+$'),
          errorMessage: 'Only lowercase letters are allowed');
      expect(validator.validate('abc'), equals(null));
      expect(validator.validate('ABC'),
          equals('Only lowercase letters are allowed'));
    });

    test('custom regex validation with next validator', () {
      var validator = CustomValidator(RegExp(r'^[a-z]+$'),
          errorMessage: 'Only lowercase letters are allowed',
          nextValidator: CustomValidator(RegExp(r'^[a-z]{3}$'),
              errorMessage: 'Only 3 letters are allowed'));
      expect(validator.validate('abc'), equals(null));
      expect(validator.validate('abcd'), equals('Only 3 letters are allowed'));
      expect(validator.validate('ABC'),
          equals('Only lowercase letters are allowed'));
    });
  });
}
