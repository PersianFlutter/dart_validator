/// `ValidatorMessages` is a utility class that provides error messages for various types of validation.
///
/// It contains static fields for each type of validation error message, such as `emptyError`, `emailWrongError`, `alphabeticalError`, etc.
/// These fields are initialized with default error messages.
///
/// The `lengthMessage` method is used to generate a dynamic error message for length validation. It replaces `{min}` and `{max}` placeholders in the `lengthErrorText` with the provided `min` and `max` values.
///
/// The `init` method allows you to customize the error messages. It accepts optional parameters for each type of error message. If a custom message is provided, it replaces the corresponding default message. If a custom message is not provided, the default message is retained.
///
/// This class is useful for providing consistent and customizable error messages for validation throughout your application.
class ValidatorMessages {
  static String emptyError = "This field is required!";
  static String emailWrongError = "Enter a valid email address!";
  static String emailEmptyError = "Email is mandatory and cannot be empty!";
  static String alphabeticalError = "This field should contain only alphabets!";
  static String alphabetDashError =
      "This field should contain only alphabets and dashes!";
  static String alphaNumericDashError =
      "This field should contain only alphabets, numbers and dashes!";
  static String alphaNumericError =
      "This field should contain only alphabets and numbers!";
  static String doubleError = "This field should contain only doubles!";

  static String passwordUpperCaseError =
      'Password must contain at least one uppercase letter';

  static String passwordLowerCaseError =
      'Password must contain at least one lowercase letter';

  static String passwordNumberError =
      'Password must contain at least one number';

  static String passwordSpecialCharError =
      'Password must contain at least one special character';

  static String urlError = 'Invalid URL';
  static String greaterThanErrorText =
      'This field should be greater than the given';
  static String greaterThanError(String value) =>
      "$greaterThanErrorText $value!";
  static String lessThanErrorText = 'This field should be less than the given';
  static String lessThanError(String value) => "$lessThanErrorText $value!";
  static String lengthErrorText =
      'This field should be between {min} and {max} characters long!';
  static String? lengthMessage(int min, int max) {
    return lengthErrorText
        .replaceAll("{min}", min.toString())
        .replaceAll("{max}", max.toString());
  }

  static String numberError = "This field should contain only numbers!";
  static String intError = "This field should contain only integers!";
  static String ipError = "Invalid Ip address!";
  static void init({
    String? customEmptyError,
    String? customEmailError,
    String? customAlphabeticalError,
    String? customAlphabetDashError,
    String? customAlphaNumericDashError,
    String? customAlphaNumericError,
    String? customDoubleError,
    String? customPasswordUpperCaseError,
    String? customPasswordLowerCaseError,
    String? customPasswordNumberError,
    String? customPasswordSpecialCharError,
    String? customUrlError,/// `ValidatorMessages` is a utility class that provides error messages for various types of validation.
///
/// It contains static fields for each type of validation error message, such as `emptyError`, `emailWrongError`, `alphabeticalError`, etc.
/// These fields are initialized with default error messages.
///
/// The `lengthMessage` method is used to generate a dynamic error message for length validation. It replaces `{min}` and `{max}` placeholders in the `lengthErrorText` with the provided `min` and `max` values.
///
/// The `initializer` method allows you to customize the error messages. It accepts optional parameters for each type of error message. If a custom message is provided, it replaces the corresponding default message. If a custom message is not provided, the default message is retained.
///
/// This class is useful for providing consistent and customizable error messages for validation throughout your application.
    String? customGreaterThanError,
    String? customLessThanError,
    String? customNumberError,
    String? customIntError,
    String? customIpError,
    String? customLengthErrorText,
  }) {
    emptyError = customEmptyError ?? emptyError;
    emailWrongError = customEmailError ?? emailWrongError;
    emailEmptyError = customEmailError ?? emailEmptyError;
    alphabeticalError = customAlphabeticalError ?? alphabeticalError;
    alphabetDashError = customAlphabetDashError ?? alphabetDashError;
    alphaNumericDashError =
        customAlphaNumericDashError ?? alphaNumericDashError;
    alphaNumericError = customAlphaNumericError ?? alphaNumericError;
    doubleError = customDoubleError ?? doubleError;
    passwordUpperCaseError =
        customPasswordUpperCaseError ?? passwordUpperCaseError;
    passwordLowerCaseError =
        customPasswordLowerCaseError ?? passwordLowerCaseError;
    passwordNumberError = customPasswordNumberError ?? passwordNumberError;
    passwordSpecialCharError =
        customPasswordSpecialCharError ?? passwordSpecialCharError;
    urlError = customUrlError ?? urlError;
    greaterThanErrorText = customGreaterThanError ?? greaterThanErrorText;
    lessThanErrorText = customLessThanError ?? lessThanErrorText;
    numberError = customNumberError ?? numberError;
    intError = customIntError ?? intError;
    ipError = customIpError ?? ipError;
    lengthErrorText = customLengthErrorText ?? lengthErrorText;
  }
}
