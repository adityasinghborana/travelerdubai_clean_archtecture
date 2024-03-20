import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) throw 'Google sign-in process canceled by user.';

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final String uid = userCredential.user!.uid;

      print('User UID: $uid');
      Get.toNamed("/home");
    } catch (e) {
      print("Sign-in error: $e");
      showSnackBar(context, e.toString());
      Get.toNamed('/Login');
    }
  }



  Future<void> signOut({required BuildContext context}) async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      showSnackBar(context, 'Sign-out successful.');
    } catch (e) {
      print("Sign-out error: $e");
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}