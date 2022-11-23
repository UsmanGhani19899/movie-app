import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuplex/Screens/Admin/adminHome.dart';
import 'package:nuplex/Screens/bottombar.dart';
import 'package:nuplex/Screens/home.dart';
import 'package:nuplex/Screens/signIn.dart';
import 'package:nuplex/Screens/signup.dart';
import 'package:nuplex/Screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Nuplex());
}

class Nuplex extends StatefulWidget {
  const Nuplex({super.key});

  @override
  State<Nuplex> createState() => _NuplexState();
}

class _NuplexState extends State<Nuplex> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nuplex',
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: AdminHome());
  }
}
