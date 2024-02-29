import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderController extends GetxController {
  final RxBool loggedin = false.obs;
  final RxMap<String, bool> isHoveredMap = <String,bool>{}.obs;

  @override
  void onInit() {
    ever(loggedin, (_) {
      // Triggered whenever loggedin changes
      print("Loggedin changed: $loggedin");
    });

    getUserUID();
    super.onInit();
  }

  void onHover(String title, bool hover) {
    isHoveredMap[title] = hover;
  }

  Future<String?> getUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('userUID');

    if (uid != null) {
      loggedin.value = true;
      print("User is logged in: $loggedin");
    }

    return uid;
  }

// Rest of your code...
}