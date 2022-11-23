import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuplex/Core/auth.dart';
import 'package:nuplex/Screens/signup.dart';
import 'package:nuplex/Widgets/customeButton.dart';
import 'package:nuplex/Widgets/customeField.dart';
import 'package:nuplex/Widgets/passwordField.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NUPLEX',
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 28),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      CustomeField(
                        controller: emailController,
                        fieldName: 'Email',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordField(
                        controller: passwordController,
                        fieldName: 'Password',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width * 0.8,
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.roboto(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomeBtn(
                  btnName: 'SignIn',
                  onPressed: () {
                    Auth().signIn(
                      context,
                      emailController.text,
                      passwordController.text,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
