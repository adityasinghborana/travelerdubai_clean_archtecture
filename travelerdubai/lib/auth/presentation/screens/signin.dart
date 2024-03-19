import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/get_cart_usecase.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/create_user_usecase.dart';

import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Components/custom_button.dart';
import '../../../Components/email_field.dart';
import '../../../Components/password_text_field.dart';
import '../../../Components/text_on_line.dart';
import '../../usersdatalayer/service/create_user_remote.dart';

class SigninPage extends StatelessWidget {
  final controller = Get.put(
    SigninController(
      createuser: CreateUserUseCase(
        UserRepositoryImpl(
          createUserRemoteService(
            Dio(),
          ),
        ),
      ),
      getCartUseCase: GetCartUseCase(
        CartRepositoryImpl(
          CartRemoteService(Dio()),
        ),
      ),
    ),
  );

  SigninPage({super.key});

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
                    'Log in',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 34,
                        color: Colors.black,
                        height: 1.01),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Login to access your Rayna account',
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
                    child:  emailField(
                        controller.emailController, 'Email', null),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => SizedBox(
                        width: MediaQuery.of(context).size.width * .338,
                        child: passwordTextField(controller.passwordController,
                            'Password', controller.obsecureText.value, (p0 ) {
                          controller.obsecureText.value =
                              !controller.obsecureText.value;
                        })),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Color(0xff2659c3),
                          ),
                        ),
                        onTap: () {
                          Get.toNamed('/forgotPassword');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: ButtonView(
                      btnName: 'Login',
                      bgColor: const Color(0xff2659c3),
                      onButtonTap: () {
                        controller.signIn();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(text: 'Don\'t have an account?'),
                            TextSpan(
                              text: 'sign up',
                              style: const TextStyle(
                                color: Color(0xff2659c3),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.goToSignUp();
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: textOnLine('Or log in With'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child:  ButtonView(
                      btnName: 'Login With Google',
                      bgColor: Color(0xffffffff),
                      txtColor: Color(0xff112211),
                      onButtonTap: () =>  controller.authClass.googleSignIn(context),
                    ),
                  ),
                ],
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

//   Widget Textitem(String placeholder, bool hidden, TextInputType inputtype,
//       TextEditingController controller) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: const Color(0xff979797)),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//         child: TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintStyle: const TextStyle(color: Color(0xff979797)),
//             hintText: placeholder,
//             border: InputBorder.none,
//           ),
//           obscureText: hidden,
//           keyboardType: inputtype,
//         ),
//       ),
//     );
//   }
// }
