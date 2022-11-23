import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuplex/Screens/Admin/incinema.dart';
import 'package:nuplex/Widgets/customeButton.dart';
import 'package:nuplex/Widgets/moviesCard.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 30, left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MoviesCard(
                cardName: 'InCinema',
                onPressed: () {
                  Get.to(InCinema());
                },
              ),
              MoviesCard(
                cardName: 'Trending',
                onPressed: () {},
              ),
              MoviesCard(
                cardName: 'Upcoming',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
