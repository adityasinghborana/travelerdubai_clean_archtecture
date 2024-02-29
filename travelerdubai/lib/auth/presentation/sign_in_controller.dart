import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/create_user_usecase.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'package:travelerdubai/auth/presentation/screens/signup.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';


class SigninController extends GetxController {
  final CreateUserUseCase createuser;
  SigninController({required this.createuser});
  RxBool isUserSignedIn = false.obs;
  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthClass authClass = AuthClass();
  final HeaderController headerController = Get.find();

  Future<void> signIn() async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final uid = userCredential.user?.uid;
      if (uid != null) {
        headerController.loggedin.value = true;
        saveUserUID(uid).then((value) {
          Get.toNamed('/dashboardpage', arguments: {'uid': uid});
        });


      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void goToSignUp() {
    Get.to(() => SignupPage());
  }

  Future<void> saveUserUID(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUID', uid);
    print("userid saved");

  }





}
