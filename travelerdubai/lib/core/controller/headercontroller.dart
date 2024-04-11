import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class HeaderController extends GetxController {
  final RxString userid = ''.obs;
  Rx<Color> navItemColor = colorblack.obs;
  final RxInt cartId = 0.obs; //need to chang for cart id
  final RxBool loggedIn = false.obs;
  final RxMap<String, bool> isHoveredMap = <String, bool>{}.obs;
  final RxBool isHeaderTransparent = true.obs;

  @override
  void onInit() {
    ever(loggedIn, (_) {
      // Triggered whenever loggedin changes
      if (kDebugMode) {
        print("LoggedIn changed: $loggedIn");
      }
    });

    getUserUID();
    getCartID();
    super.onInit();
  }

  void updateHeaderBackground(double scrollOffset) {
    if (scrollOffset > 0) {
      navItemColor.value = colorgreenishblack;
      isHeaderTransparent.value = false; // Set to false when scrolled
    } else {
      navItemColor.value = colorwhite;
      isHeaderTransparent.value = true; // Set to true when at the top
    }
  }

  void onHover(String title, bool hover) {
    isHoveredMap[title] = hover;
  }

  Future<String?> getUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('userUID');

    if (uid != null) {
      loggedIn.value = true;
      userid.value = uid;
      print("User is logged in: $loggedIn");
      print("User is logged in: ${userid.value}");
      print("User is logged in: ${cartId.value}");
    }

    return uid;
  }

  Future<String?> getCartID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartIdCustom = prefs.getString('CartID');

    cartId.value = int.parse(cartIdCustom ?? "00");

    if (kDebugMode) {
      print("User is logged in: ${cartId.value}");
    }

    return cartIdCustom;
  }
}
