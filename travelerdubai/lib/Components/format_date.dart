import 'package:intl/intl.dart';

String formatDate(String dateString) {
  // Parse the string date into a DateTime object
  DateTime dateTime = DateFormat('yyyy-MM-DD').parse(dateString);

  // Format the DateTime object as desired
  String formattedDate = DateFormat('EEEE, ddMMMM yyyy').format(dateTime);

  return formattedDate;
}
