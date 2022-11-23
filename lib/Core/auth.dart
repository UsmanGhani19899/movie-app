import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuplex/Models/userModel.dart';
import 'package:nuplex/Screens/bottombar.dart';
import 'package:nuplex/Screens/home.dart';
import 'package:nuplex/main.dart';

import '../Screens/signIn.dart';

class Auth {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> createDatabase(UserModel user, User firestoreUser) async {
    await _db.collection("Users").doc('${firestoreUser.uid}').set(user.toMap());
  }

  signUp(
    BuildContext context,
    String name,
    String email,
    String password,
    String photo,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        UserModel userModel = UserModel(
            email: value.user!.email,
            name: name,
            photo: photo,
            uid: value.user!.uid);
        await createDatabase(userModel, value.user!);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.off(BottomBar()));
    } catch (e) {}
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut().then((value) => Get.off(SignIn()));
  }
}
