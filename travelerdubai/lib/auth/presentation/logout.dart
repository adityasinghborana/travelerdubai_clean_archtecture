import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/controller/headercontroller.dart';
class Logout{
  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final HeaderController headerController = Get.find();
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      headerController.loggedIn.value = false;
      await _clearUserUID();
      await _clearCartID();
      Get.offAllNamed('/home'); // Navigate to home and remove all previous routes
    } catch (e) {
      print("Logout error: $e");
    }
  }
  Future<void> _clearUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userUID');
    print("userUID cleared");
  }

  Future<void> _clearCartID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('CartID');
    print("CartID cleared");
  }
}