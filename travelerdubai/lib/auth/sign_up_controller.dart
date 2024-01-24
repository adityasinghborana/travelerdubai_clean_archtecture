import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:travelerdubai/core/service/auth.dart';
import 'dart:html' as html;

class SignupController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Call the function to retrieve local storage data when the controller is initialized
    retrieveLocalStorageData();
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

      // Store the user's token and UID in localStorage
      final user = authResult.user;
      if (user != null) {
        final token = (await user.getIdToken()) ?? '';
        html.window.localStorage['userToken'] = token;
        html.window.localStorage['uid'] = user.uid;
        html.window.localStorage['useremail'] = user.email ?? "";
        createuser(user.uid, user.email);
        print("hello");
      }

      print(html.window.localStorage['uid']);
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('firebase_auth/', '');
      Get.snackbar("Error", errorMessage);
    }
  }

  void retrieveLocalStorageData() {
    final userToken = html.window.localStorage['userToken'];
    final uid = html.window.localStorage['uid'];

    if (userToken != null && uid != null) {
      // Use the retrieved data as needed
      print('User Token: $userToken');
      print('UID: $uid');
    } else {
      // Handle the case where data is not found in local storage
      print('Data not found in local storage');
    }
  }

  void createuser(String uid, String? email) async {
    try {
      final response = await _dio.post(
        'http://localhost:3000/createusers',
        data: {
          'uid': uid,
          'email': email,
        },
      );

      // Check the response and handle it as needed
      if (response.statusCode == 200) {
        // Successful response
        print('POST request was successful');
        print('Response data: ${response.data}');
      }
      if (response.statusCode == 400) {
        // Successful response
        print('POST request was successful');
        print('Response data: ${response.data}');
      } else {
        // Handle other status codes (e.g., error responses)
        print('POST request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any Dio errors
      print('Error sending POST request: $e');
    }
  }
}
