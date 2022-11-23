import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottombar.dart';
import 'signIn.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

User? userLogin = FirebaseAuth.instance.currentUser;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (userLogin != null) {
        Get.off(BottomBar());
      } else {
        Get.off(SignIn());
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'nuplex'.toUpperCase(),
        style: GoogleFonts.openSans(
            color: Colors.white, fontSize: 90, fontWeight: FontWeight.w800),
      )),
    );
  }
}
