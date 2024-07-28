import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/auth/presentation/screens/signup.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/create_user_usecase.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/service/auth.dart';

import '../../Cart/data_layer/model/request/create_cart.dart';
import '../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../core/helperfunctions.dart';

class SigninController extends GetxController {
  final CreateUserUseCase createuser;
  final GetCartUseCase getCartUseCase;
  final RxBool obsecureText = true.obs;

  SigninController({required this.createuser, required this.getCartUseCase});

  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthClass authClass = AuthClass();
  final RxInt cartId = 0.obs;

  final HeaderController headerController = Get.find();


  @override
  void onInit() {
    Get.put(HeaderController());// TODO: implement onInit
    super.onInit();
  }



  Future<void> signIn() async {

    try {
      print("hello email${emailController.text}");
      print("hello email${passwordController.text}");

      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final uid = userCredential.user?.uid;
      if (uid != null) {
        headerController.loggedIn.value = true;
        saveEmailId(userCredential?.user?.email);
        getCart(uid);
        await saveUserUID(uid).then((value) {
          if (Get.previousRoute == '/signup') {
            // If the previous page was signup, go back twice to avoid going back to signup
            Get.until((route) => Get.currentRoute == '/');
          } else {
            Get.back();
          }
        });
      }
    } catch (e) {
      print(emailController.text);
      Get.snackbar("Error", e.toString());
    }
  }

  void goToSignUp() {
    Get.to(() => SignupPage());
  }

  Future<void> saveUserUID(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUID', uid);
    if (kDebugMode) {
      print("userid saved");
    }
  }

  Future<void> saveCartID(String cartid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('CartID', cartid);
    print("cartid saved");
  }

  Future<void> saveEmailId(String? emailId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('emailID', emailId!);
    print("emailId saved");
  }


  Future<void> getCart(String uid) async {
    CreateCartRequest data = CreateCartRequest(userId: uid);

    getCartUseCase.execute(data).then((value) {
      if (value.data.isNotEmpty) {
        cartId.value = value.data[0].id;
        cartItemsLength.value = value.data[0].TourDetails.length;

        saveCartLength(value.data[0].TourDetails.length);
        print(value.data[0].TourDetails.length);
        headerController.cartId.value = cartId.value;
        saveCartID(cartId.value.toString());
        print(cartId.value);
      } else {
        print('Error fetching cart: ${value.success}');
      }
    }).catchError((error) {
      // Handle generic error
      print('Error: $error');
    });
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) throw 'Google sign-in process canceled by user.';

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      final String uid = userCredential.user!.uid;
      final String name = userCredential.user!.displayName!;
      saveEmailId(userCredential?.user?.email);

      headerController.loggedIn.value = true;
      await getCart(uid);
      await saveUserUID(uid);
      if (Get.previousRoute == '/SignupPage') {
        // If the previous page was signup, go back twice to avoid going back to signup
        Get.until((route) => Get.currentRoute == '/home');
      } else {
        Get.back();
      }
    } catch (e) {
      print("Sign-in error: $e");
      authClass.showSnackBar(context, e.toString());
      Get.toNamed('/Login');
    }
  }


  

}

