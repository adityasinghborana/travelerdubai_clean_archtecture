import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/Components/header.dart';

import '../../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../../Cart/data_layer/service/cart_remote.dart';
import '../../../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../../../Components/custom_button.dart';
import '../../../../Components/email_field.dart';
import '../../../../Components/password_text_field.dart';
import '../../../../Components/text_on_line.dart';
import '../../../usersdatalayer/repository/user_repository.dart';
import '../../../usersdatalayer/service/create_user_remote.dart';
import '../../../usersdatalayer/usecase/create_user_usecase.dart';
import '../../sign_in_controller.dart';

class SigninDesktop extends StatelessWidget {
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

  SigninDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(gradient: backgroundgradient),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: Get.width * .084215),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * .10,
                        ),
                        SizedBox(
                            height: Get.height * 0.060916,
                            child: Image.asset("../assets/images/logo.png")),
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
                          'Login to access your TravelerDubai account',
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
                          child: emailField(
                              60, controller.emailController, 'Email', null),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => SizedBox(
                              width: Get.width * .338,
                              child: passwordTextField(
                                  60,
                                  controller.passwordController,
                                  'Password',
                                  controller.obsecureText.value, (p0) {
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
                                  color: colorblue,
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
                          width: Get.width * .338,
                          child: ButtonView(
                            borderColor: colorblue,
                            btnName: 'Login',
                            bgColor: colorblue,
                            onButtonTap: () {
                              controller.signIn();
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: Get.width * .338,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'Don\'t have an account?'),
                                  TextSpan(
                                    text: 'sign up',
                                    style: const TextStyle(
                                      color: colorblue,
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
                          width: Get.width * .338,
                          child: Opacity(
                            opacity: 0.5,
                            child: textOnLine('Or log in With',
                                colorgreenishblack.withOpacity(0.5)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: Get.width * .338,
                          child: ButtonView(
                            borderColor: colorblue,
                            iconData: FontAwesomeIcons.google,
                            btnName: 'Login With Google',
                            bgColor: colorwhite,
                            txtColor: colorgreenishblack,
                            onButtonTap: () => controller.googleSignIn(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * .084215,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: Get.height * .10,
                        ),
                        Image.asset(
                          '../assets/images/signup_side_image.png',
                          height: Get.height * .83,
                          width: Get.width * .3227,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * .084215,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
