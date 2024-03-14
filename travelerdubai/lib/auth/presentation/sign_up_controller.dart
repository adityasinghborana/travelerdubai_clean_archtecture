import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/create_cart_response.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/request/create_user_request.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/service/auth.dart';

import '../../Cart/data_layer/usecase/create_cart_usecase.dart';
import '../usersdatalayer/usecase/create_user_usecase.dart';

class SignupController extends GetxController {
  final HeaderController headerController = Get.find();
  final CreateUserUseCase createuser;
  final CreateCartUseCase createCartUseCase;

  SignupController({required this.createuser, required this.createCartUseCase});

  @override
  void onInit() {
    super.onInit();

    // Call the function to retrieve local storage data when the controller is initialized
    // retrieveLocalStorageData();
  }

  final Dio _dio = Dio();
  final AuthClass authClass = AuthClass();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUp() async {
    try {
      final authResult = await firebase_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      final user = authResult.user;
      if (user != null) {
        final token = (await user.getIdToken()) ?? '';
        saveUser(user.uid, user.email!).then((value) {
          headerController.loggedin.value = true;
          createCart(user.uid);
          Get.toNamed('/home');
        });
      }
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('firebase_auth/', '');
      Get.snackbar("Error", errorMessage);
    }
  }

  Future<void> saveUser(String Uid, String Email) async {
    try {
      await createuser
          .execute(User(uid: Uid, email: Email))
          .then((value) => print(value));
    } catch (e) {
      print(e);
    }
  }

  void createCart(String Uid) async {
    try {
      await createCartUseCase
          .execute(CreateCartRequest(userId: Uid))
          .then((value) => print(value));
    } catch (e) {
      print(e);
    }
  }
}
