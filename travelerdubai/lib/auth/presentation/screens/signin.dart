import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/auth/presentation/screens/forgotpassword.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/create_user_usecase.dart';

import '../../usersdatalayer/service/create_user_remote.dart';

class SigninPage extends StatelessWidget {
  final controller = Get.put(
      SigninController(createuser: CreateUserUseCase(UserRepositoryImpl(createUserRemoteService(Dio())))));

  SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: Get.height * .55,
          width: Get.width * .2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                './assets/logo.png',
                fit: BoxFit.cover,
                scale: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Textitem("Email Address", false,
                    TextInputType.emailAddress, controller.emailController),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                child: Textitem("Password", true, TextInputType.visiblePassword,
                    controller.passwordController),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => Forgotpassword());
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "arial",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff979797),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  child: ElevatedButton(
                    onPressed: () => controller.signIn(),
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: const Color(0xffBF1D2D),
                    ),
                    child: const Text("Sign In"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () => controller.goToSignUp(),
                  child: const Text(
                    "Create new Account",
                    style: TextStyle(
                      fontFamily: "arial",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 210, 104, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Textitem(String placeholder, bool hidden, TextInputType inputtype,
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xff979797)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Color(0xff979797)),
            hintText: placeholder,
            border: InputBorder.none,
          ),
          obscureText: hidden,
          keyboardType: inputtype,
        ),
      ),
    );
  }
}
