import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getEmailID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? Email = prefs.getString('emailID');

  return Email;
}