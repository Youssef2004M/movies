abstract class MyValidation {
  static final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static final RegExp phoneRegex = RegExp(
      r'^\+?[0-9]{1,3}?[-.\s]?[0-9]{1,4}?[-.\s]?[0-9]{4,6}$');

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "email is required";
    }
    if (!(emailRegex.hasMatch(value))) {
      return "invalid email";
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    if (!(phoneRegex.hasMatch(value))) {
      return "Invalid Phone Number";
    }
    return null;
  }

  static String? passValidation(String? value) {
    if (value!.length < 6) {
      return "Password is too small";
    }
    return null;
  }
}
