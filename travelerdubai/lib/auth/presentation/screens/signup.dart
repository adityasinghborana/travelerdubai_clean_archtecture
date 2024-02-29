import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/auth/presentation/sign_up_controller.dart';
import 'package:travelerdubai/auth/presentation/screens/signin.dart';

import '../../usersdatalayer/repository/user_repository.dart';
import '../../usersdatalayer/service/create_user_remote.dart';
import '../../usersdatalayer/usecase/create_user_usecase.dart';

class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController(createuser: CreateUserUseCase(UserRepositoryImpl(createUserRemoteService(Dio())))));

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("./assets/logo.png"),
              const SizedBox(height: 20),
              _buildEmailTextField(signupController.emailController),
              const SizedBox(height: 10),
              _buildPasswordTextField(signupController.passwordController),
              const SizedBox(height: 20),
              _buildSignUpButton(signupController),
              const SizedBox(height: 10),
              _buildLoginLink(),
            ],
          ),
        ),
      ),
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
