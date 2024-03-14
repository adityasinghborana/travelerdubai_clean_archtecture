class Validation {
  static bool isValidEmail(String email) {
    // Define a regular expression pattern for a basic email format
    RegExp regex = RegExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$');

    // Check if the email matches the pattern
    return regex.hasMatch(email);
  }

  static bool isValidFirstName(String firstName) {
    // Define the minimum and maximum allowed length for the first name
    int minLength = 2;
    int maxLength = 30;

    // Check the length
    if (firstName.length < minLength || firstName.length > maxLength) {
      return false;
    }

    // Check if the first name contains only alphabetic characters and spaces
    RegExp regex = RegExp(r'^[a-z A-Z]+$', dotAll: true);
    return regex.hasMatch(firstName);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Define the minimum and maximum allowed length for the phone number
    int minLength = 10;
    int maxLength = 15;

    // Check the length
    if (digitsOnly.length < minLength || digitsOnly.length > maxLength) {
      return false;
    }

    // You may have additional criteria here, depending on your needs.

    // For example, you might want to check if the phone number starts with a specific country code.

    // Regular expression to check if the phone number contains only digits
    RegExp regex = RegExp(r'^\d+$');
    return regex.hasMatch(digitsOnly);
  }


}