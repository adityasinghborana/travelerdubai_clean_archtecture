import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/auth/presentation/screens/signup.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/create_user_usecase.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/service/auth.dart';

import '../../Cart/data_layer/model/request/create_cart.dart';
import '../../Cart/data_layer/usecase/get_cart_usecase.dart';

class SigninController extends GetxController {
  final CreateUserUseCase createuser;
  final GetCartUseCase getCartUseCase;
  final RxBool obsecureText = false.obs;

  SigninController({required this.createuser, required this.getCartUseCase});

  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthClass authClass = AuthClass();
  final RxInt cartId = 0.obs;
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

        getCart(uid);
        await saveUserUID(uid).then((value) {
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
    if (kDebugMode) {
      print("userid saved");
    }
  }

  Future<void> saveCartID(String cartid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('CartID', cartid);
    print("cartid saved");
  }

  Future<void> getCart(String uid) async {
    CreateCartRequest data = CreateCartRequest(userId: uid);

    getCartUseCase.execute(data).then((value) {
      if (value.data[0].TourDetails.isNotEmpty) {
        cartId.value = value.data[0].TourDetails[0].cartId;
        headerController.cartid.value = cartId.value;
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
}
