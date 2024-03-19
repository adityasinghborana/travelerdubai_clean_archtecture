import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/auth/presentation/screens/signin.dart';

import '../../../Components/custom_button.dart';
import '../../../Components/email_field.dart';

class ForgotPassword extends StatelessWidget {
  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();

  ForgotPassword({super.key});
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
                    height: MediaQuery.of(context).size.height * 0.060916,
                    child: Image.asset("./assets/logo.png"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new,
                        size: 24,
                        color: Color(0xff112211),
                      ),
                      Text(
                        'Back to Login',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff112211),
                            height: 1.1721),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Forgot Your Password?',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 34,
                        color: Colors.black,
                        height: 1.01),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: Text(
                      'Don’t worry, happens to all of us. Enter your email below to recover your password',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff112211),
                        height: 1.1721,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: emailField(
                        _emailController, 'Email', 'john.doe@gmail.com'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .338,
                    child: ButtonView(
                      btnName: 'Submit',
                      bgColor: const Color(0xff2659c3),
                      onButtonTap: () {},
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

  Future resetpassword(BuildContext context) async {
    try {
      await firebase_auth.FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      const snackbar =
          SnackBar(content: SelectableText("Reset link Sent to Email"));

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (Context) => SigninPage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      final snackbar = SnackBar(content: SelectableText(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
