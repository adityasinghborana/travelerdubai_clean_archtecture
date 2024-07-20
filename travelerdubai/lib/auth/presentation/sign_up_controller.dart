import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/request/create_user_request.dart'
    as UserData;
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/service/auth.dart';

import '../../Cart/data_layer/usecase/create_cart_usecase.dart';
import '../usersdatalayer/usecase/create_user_usecase.dart';

enum PasswordState { entered, notEntered }

class SignupController extends GetxController {
  final HeaderController headerController = Get.find();
  final SigninController signinController = Get.find();
  final CreateUserUseCase createUserUseCase;
  final CreateCartUseCase createCartUseCase;
  final RxBool obscureText = true.obs;
  RxBool passwordMatched = false.obs;
  RxBool checkBoxValue = false.obs;
  var passwordState = PasswordState.notEntered.obs;

  SignupController(
      {required this.createUserUseCase, required this.createCartUseCase});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthClass authClass = AuthClass();
  final Dio dio = Dio();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void onInit() {
    super.onInit();
    // Initialization code here
  }

  void signUp() async {
    try {
      final authResult = await firebase_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final user = authResult.user;
      if (user != null) {
        final token = await user.getIdToken() ?? '';
        await saveUser(user.uid, user.email!);
        headerController.loggedIn.value = true;
        createCart(user.uid);
        Get.toNamed('/home');
      }
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('firebase_auth/', '');
      Get.snackbar("Error", errorMessage);
    }
  }

  Future<void> saveUser(String uid, String email) async {
    try {
      final user = UserData.User(uid: uid, email: email);
      await createUserUseCase.execute(user).then((response ){saveUserUID(uid);});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> saveUserUID(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUID', uid);
    if (kDebugMode) {
      print("userid saved");
    }
  }

  void createCart(String uid) async {
    try {
      final request = CreateCartRequest(userId: uid);
      await createCartUseCase.execute(request).then((_)=>{

        signinController.getCart(uid),
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> googleSignUp(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null)
        throw 'Google sign-in process canceled by user.';

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await firebase_auth
          .FirebaseAuth.instance
          .signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final token = await user.getIdToken() ?? '';
        await saveUser(user.uid, user.email!);
        headerController.loggedIn.value = true;
        createCart(user.uid);
        
        Get.toNamed('/home');
      }
    } catch (e) {
      print("Google sign-up error: $e");
      showSnackBar(context, e.toString());
      Get.toNamed('/Login');
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
