import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: Get.height * 0.5,
            width: Get.width * 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/IMDb-Doctor-Strange.jpg'),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '2h 37m',
                style: GoogleFonts.openSans(
                    color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(
            width: Get.width * 0.8,
            child: Text(
              'Doctor Strange in the Multiverse of Madness',
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            alignment: Alignment.center,
            height: Get.height * 0.05,
            width: Get.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (contxt, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(22)),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      'Action',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
