import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final RxInt cartItemsLength=0.obs;
Future<String?> getEmailID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? Email = prefs.getString('emailID');

  return Email;
}
Future<void> saveCartLength(int cartlength) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('Cartlength', cartlength);
  cartItemsLength.value = cartlength;
}