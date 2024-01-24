import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'package:travelerdubai/auth/presentation/signup.dart';
import 'dart:html' as html;

class SigninController extends GetxController {
  RxBool isUserSignedIn = false.obs;
  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthClass authClass = AuthClass();

  Future<void> signIn() async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final uid = userCredential.user?.uid;
      if (uid != null) {
        Get.toNamed('/panel', arguments: {'uid': uid});
        html.window.localStorage['uid'] = uid;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void goToSignUp() {
    Get.to(() => SignupPage());
  }

//   Future<void> saveUserUID(String uid) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userUID', uid);
//   }

//   Future<String?> getUserUID() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('userUID') as String;
//   }
// }

// Future<void> deleteUserUID() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.remove('userUID');
}
