import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:travelerdubai/auth/usersdatalayer/model/request/create_user_request.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'dart:html' as html;

import '../usersdatalayer/usecase/create_user_usecase.dart';

class SignupController extends GetxController {
  final CreateUserUseCase createuser;
  SignupController({required this.createuser});
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
          Get.toNamed('/home');
        });

      }


    } catch (e) {
      final errorMessage = e.toString().replaceFirst('firebase_auth/', '');
      Get.snackbar("Error", errorMessage);
    }
  }



  // void createeuser(String uid, String? email) async {
  //   try {
  //     final response = await _dio.post(
  //       'http://localhost:3000/createusers',
  //       data: {
  //         'uid': uid,
  //         'email': email,
  //       },
  //     );
  //
  //     // Check the response and handle it as needed
  //     if (response.statusCode == 200) {
  //       // Successful response
  //       print('POST request was successful');
  //       print('Response data: ${response.data}');
  //     }
  //     if (response.statusCode == 400) {
  //       // Successful response
  //       print('POST request was successful');
  //       print('Response data: ${response.data}');
  //     } else {
  //       // Handle other status codes (e.g., error responses)
  //       print('POST request failed with status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Handle any Dio errors
  //     print('Error sending POST request: $e');
  //   }
  // }


  // Future<void> Createuser() async {
  //   try {
  //
  //     );
  //
  //     final uid = userCredential.user?.uid;
  //     if (uid != null) {
  //       saveUserUID(uid).then((value) {
  //         headerController.loggedin.value = true;
  //         Get.toNamed('/dashboardpage', arguments: {'uid': uid});
  //       });
  //
  //
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }


Future<void>saveUser(String Uid , String Email) async{
  try {
    await createuser.execute(User(uid: Uid, email: Email)).then((value) => print(value));
  }
  catch (e) {
    print(e);
  }
}
}
