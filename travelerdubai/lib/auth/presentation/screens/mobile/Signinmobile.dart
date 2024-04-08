import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';

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

class SigninMobile extends StatelessWidget {
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
  SigninMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          gradient: backgroundgradient
        ),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Image.asset(
                    "../assets/assets/images/signupmobile.png",
                    width: Get.width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    width: Get.width * .60,
                    left: 40,
                    bottom: 30,
                    child: Image.asset(
                      "../assets/assets/images/whitelogo.png",
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .05, vertical: Get.height * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log in',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.black,
                        height: 1.01,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: Get.width,
                      child: emailField(
                        50, controller.emailController, 'Email', null,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(
                          () => SizedBox(
                        child: passwordTextField(
                            50, controller.passwordController, 'Password',
                            controller.obsecureText.value, (p0) {
                          controller.obsecureText.value = !controller.obsecureText.value;
                        }
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(
                              color:colorblue,
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
                      width: Get.width,
                      child: ButtonView(
                        btnName: 'Login',
                        bgColor:  colorblue,
                        onButtonTap: () {
                          controller.signIn();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: Get.width,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'Don\'t have an account?'
                              ),
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
                      width: Get.width,
                      child: Opacity(opacity: 0.5,
                          child: textOnLine('Or log in With', colorgreenishblack)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: Get.width,
                      child: ButtonView(
                        iconData:FontAwesomeIcons.google,
                        btnName: 'Login With Google',
                        bgColor: colorwhite,
                        txtColor:colorgreenishblack,
                        borderColor: colorblue,
                        onButtonTap: () =>
                            controller.googleSignIn(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
            ),
            SizedBox(
              width: Get.width * .084215,
            ),
          ],
        ),
      ),
    );
  }
}
