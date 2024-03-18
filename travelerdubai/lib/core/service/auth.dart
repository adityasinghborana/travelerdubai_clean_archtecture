import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut({required BuildContext context}) async {
    try {
      // await _googleSignIn.signOut();
      await _auth.signOut();
      // Store the sign-out status
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // Future<void> verifyPhoneNumber(
  //     String phoneNumber, BuildContext context, Function setData) async {
  //   // Existing code
  // }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
