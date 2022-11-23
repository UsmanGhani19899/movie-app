import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesCard extends StatefulWidget {
  String? cardName;
  String? cardImage;
  final onPressed;
  MoviesCard({super.key, this.cardImage, this.cardName, this.onPressed});

  @override
  State<MoviesCard> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: Get.height * 0.25,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  image: AssetImage('assets/images/IMDb-Doctor-Strange.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.cardName}',
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
