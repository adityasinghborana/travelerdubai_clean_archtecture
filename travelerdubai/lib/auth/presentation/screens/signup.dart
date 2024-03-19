import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/create_cart_usecase.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/text_on_line.dart';
import 'package:travelerdubai/auth/presentation/screens/signin.dart';
import 'package:travelerdubai/auth/presentation/sign_up_controller.dart';

import '../../usersdatalayer/repository/user_repository.dart';
import '../../usersdatalayer/service/create_user_remote.dart';
import '../../usersdatalayer/usecase/create_user_usecase.dart';

class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(
    SignupController(
      createuser: CreateUserUseCase(
        UserRepositoryImpl(
          createUserRemoteService(Dio()),
        ),
      ),
      createCartUseCase: CreateCartUseCase(
        CartRepositoryImpl(
          CartRemoteService(Dio()),
        ),
      ),
    ),
  );

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .084215,
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .10,
                  ),
                  Image.asset(
                    'signup_side_image.png',
                    height: MediaQuery.of(context).size.height * .83,
                    width: MediaQuery.of(context).size.width * .3227,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .084215,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .10,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.060916,
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
                    width: MediaQuery.of(context).size.width * .338,
                    child: _firstNameTextField(
                        signupController.emailController, 'Email'),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => SizedBox(
                        width: MediaQuery.of(context).size.width * .338,
                        child: _passwordTextField(
                            signupController.passwordController,
                            'Password',
                            signupController.obsecureText.value, (p0) {
                          signupController.obsecureText.value =
                              !signupController.obsecureText.value;
                        })),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) => !value!),
                      const Text(
                          'I agree to all the Terms and Privacy Policies'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child:  ButtonView(
                      onButtonTap: () => signupController.signUp(),

                      btnName: 'Create Account',
                      bgColor: Color(0xff2659c3),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(text: 'Already have an account?'),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Color(0xff2659c3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: textOnLine('Or sign up With'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: const ButtonView(
                      btnName: 'Login With Google',
                      bgColor: Color(0xffffffff),
                      txtColor: Color(0xff112211),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .084215,
              ),
            ],
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
              obscureText:
                  obscureText, // Toggle visibility based on the obscureText parameter
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

  Widget _labelField(String label) {
    return Container(
      color: Colors.white,
      child: Text(label),
    );
  }

  Widget _buildEmailTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: "Email Address",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSignUpButton(SignupController controller) {
    return ElevatedButton(
      onPressed: controller.signUp,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purpleAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40),
      ),
      child: const Text("Sign Up"),
    );
  }

  Widget _buildLoginLink() {
    return GestureDetector(
      onTap: () => Get.to(SigninPage()),
      child: const Text(
        "Already Have an Account? Login",
        style: TextStyle(
          fontFamily: "arial",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          color: Colors.purpleAccent,
        ),
      ),
    );
  }
}
