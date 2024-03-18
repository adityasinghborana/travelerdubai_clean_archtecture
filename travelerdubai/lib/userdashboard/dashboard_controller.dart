import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';

import '../core/service/auth.dart';

class DashBoardController extends GetxController {


  RxInt selectedIndex = 0.obs;
  final AuthClass authClass = AuthClass();

  Future<void> signOut() async {
    await authClass.signOut(context: Get.context!).then((value) =>   deleteUserUID());
  
    Get.offAllNamed(
        '/home'); // Assuming '/login' is the route for the login screen
  }

  Future<void> deleteUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userUID');
  }


}