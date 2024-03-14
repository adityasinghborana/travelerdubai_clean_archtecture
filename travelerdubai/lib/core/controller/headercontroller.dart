import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderController extends GetxController {
  final RxString userid = ''.obs;
  final RxInt  cartid = 0.obs; //need to chang for cart id
  final RxBool loggedin = false.obs;
  final RxMap<String, bool> isHoveredMap = <String, bool>{}.obs;

  @override
  void onInit() {
    ever(loggedin, (_) {
      // Triggered whenever loggedin changes
      print("Loggedin changed: $loggedin");
    });

    getUserUID();
    getCartID();
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
      userid.value = uid;
      print("User is logged in: $loggedin");
      print("User is logged in: ${userid.value}");
      print("User is logged in: ${cartid.value}");

    }

    return uid;
  }



  Future<String?> getCartID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartId = prefs.getString('CartID');

    if (cartid != null) {

  cartid.value = int.parse(cartId??"00");

      print("User is logged in: ${cartid.value}");

    }

    return cartId;
  }
}
