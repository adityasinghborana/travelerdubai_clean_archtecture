import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/create_cart_usecase.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/text_on_line.dart';
import 'package:travelerdubai/auth/presentation/sign_up_controller.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../usersdatalayer/repository/user_repository.dart';
import '../../../usersdatalayer/service/create_user_remote.dart';
import '../../../usersdatalayer/usecase/create_user_usecase.dart';

class SignUpMobile extends StatelessWidget {
  final SignupController signupController = Get.put(
    SignupController(
      createCartUseCase: CreateCartUseCase(
        CartRepositoryImpl(
          CartRemoteService(Dio()),
        ),
      ),
      createUserUseCase: CreateUserUseCase(
        UserRepositoryImpl(
          createUserRemoteService(Dio()),
        ),
      ),
    ),
  );

  SignUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: backgroundgradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * .05,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: Get.height * 0.04,
                  child: Image.asset("./assets/logo.png",)),
            ),
             SizedBox(height: MediaQuery.of(context).size.height*0.09),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sign up',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.black,
                    height: 1.01),
              ),
            ),
            SizedBox(height: Get.height * 0.016),
            Text(
              'Let’s get you all st up so you can access your personal account.',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.01),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: Get.height * 0.03),
            SizedBox(
              width: Get.width ,
              child:
                  _firstNameTextField(signupController.emailController, 'Email'),
            ),
             SizedBox(height: Get.height* 0.015),
            Obx(
              () => SizedBox(
                  width: Get.width ,
                  child: _passwordTextField(signupController.passwordController,
                      'Password', signupController.obscureText.value, (p0) {
                    signupController.obscureText.value =
                        !signupController.obscureText.value;
                  })),
            ),
            SizedBox(height: Get.height * 0.018),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) => !value!),
                const Text('I agree to all the Terms and Privacy Policies'),

              ],
            ),
            SizedBox(height: Get.height * 0.02),
            SizedBox(
              width: Get.width ,
              child: ButtonView(
                radius: 5,
                onButtonTap: () => signupController.signUp(),
                borderColor: colorblue,
                btnName: 'Create Account',
                bgColor: colorblue,
              ),
            ),
            SizedBox(height: Get.height * 0.016),

            SizedBox(
              width: Get.width ,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Already have an account?'),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: colorblue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('Login');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            SizedBox(
              width: Get.width,
              child: Opacity(
                  opacity: 0.5,
                  child: textOnLine('Or sign up With', colorgreenishblack)),
            ),
             SizedBox(height: Get.height * 0.04),
            SizedBox(
              width: Get.width ,
              child: ButtonView(
                radius: 5,
                iconColor: colorgreenishblack,
                iconData: FontAwesomeIcons.google,
                btnName: 'Google',
                borderColor: colorblue,
                bgColor: colorwhite,
                txtColor: colorgreenishblack.withOpacity(0.5),
                onButtonTap: () {
                  signupController.googleSignUp(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstNameTextField(TextEditingController controller, String label) {
    return Stack(
      children: [
        SizedBox(
          height: 60, // Adjust the height of the TextField
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 20, left: 20), // Adjust top padding as needed
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10, // Adjust left positioning as needed
          top: 0,

          // Position label above the top border
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: Colors.white, // Adjust background color as needed
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black, // Adjust label color as needed
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField(TextEditingController controller, String label,
      bool obscureText, Function(bool) onVisibilityChanged) {
    return Stack(
      children: [
        SizedBox(
          height: 60, // Adjust the height of the TextField
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              // Toggle visibility based on the obscureText parameter
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 20, left: 20), // Adjust top padding as needed
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                // Add suffixIcon for the visibility toggle button
                suffixIcon: IconButton(
                  icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    // Toggle visibility and notify the parent
                    onVisibilityChanged(!obscureText);
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 0,
          // Position label above the top border
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: Colors.white,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
