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
  static String greaterThanError(String value) =>
      "This field should be greater than the given $value!";
  static String lessThanError(String value) =>
      "This field should be less than the given $value!";
  static String numberError = "This field should contain only numbers!";
  static String intError = "This field should contain only integers!";
  static String ipError = "Invalid Ip address!";
  static void initializer({String? customEmptyError}) {
    emptyError = customEmptyError ?? emptyError;
  }

  static String? lengthMessage(int min, int max) =>
      "This field should be between $min and $max characters long!";
}
