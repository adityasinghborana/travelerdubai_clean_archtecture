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

class SignUpDesktop extends StatelessWidget {
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

  SignUpDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: backgroundgradient),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * .084215,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * .10,
                      ),
                      Image.asset(
                        'signup_side_image.png',
                        height: Get.height * .83,
                        width: Get.width * .3227,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * .084215,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .10,
                      ),
                      SizedBox(
                          height: Get.height * 0.060916,
                          child: Image.asset("./assets/logo.png")),
                      const SizedBox(height: 20),
                      Text(
                        'Sign up',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 34,
                            color: Colors.black,
                            height: 1.01),
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 20),
                      SizedBox(
                        width: Get.width * .338,
                        child: _firstNameTextField(
                            signupController.emailController, 'Email'),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => SizedBox(
                            width: Get.width * .338,
                            child: _passwordTextField(
                                signupController.passwordController,
                                'Password',
                                signupController.obscureText.value, (p0) {
                              signupController.obscureText.value =
                                  !signupController.obscureText.value;
                            })),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) => !value!),
                          Flexible(
                            flex: 1,
                            child: const Text(
                                'I agree to all the Terms and Privacy Policies'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * .338,
                        child: ButtonView(
                          onButtonTap: () => signupController.signUp(),
                          borderColor: colorblue,
                          btnName: 'Create Account',
                          bgColor: colorblue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * .338,
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
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * .338,
                        child: Opacity(
                            opacity: 0.5,
                            child: textOnLine(
                                'Or sign up With', colorgreenishblack)),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * .338,
                        child: ButtonView(
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
                SizedBox(
                  width: Get.width * .084215,
                ),
              ],
            ),
          ),
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
                  borderRadius: BorderRadius.circular(8.0),
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
                  borderRadius: BorderRadius.circular(8.0),
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
}
