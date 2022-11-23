import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuplex/Models/addMovie.dart';
import 'package:nuplex/Screens/Admin/incinema.dart';

class Database {
  User? user;
  InCinema(
      {BuildContext? context,
      String? image,
      String? name,
      String? description}) async {
    try {
      AddMovieModel addMovie = AddMovieModel(
          description: description, name: name, photo: image, uid: user!.uid);
      await FirebaseFirestore.instance
          .collection('InCinema')
          .add(addMovie.toMap());
    } catch (e) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  upComing(
      {BuildContext? context,
      String? image,
      String? name,
      String? description}) async {
    try {
      AddMovieModel addMovie = AddMovieModel(
          description: description, name: name, photo: image, uid: user!.uid);
      await FirebaseFirestore.instance
          .collection('InCinema')
          .add(addMovie.toMap());
    } catch (e) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  trending(
      {BuildContext? context,
      String? image,
      String? name,
      String? description}) async {
    try {
      AddMovieModel addMovie = AddMovieModel(
          description: description, name: name, photo: image, uid: user!.uid);
      await FirebaseFirestore.instance
          .collection('InCinema')
          .add(addMovie.toMap());
    } catch (e) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text('$e')));
    }
  }
}
