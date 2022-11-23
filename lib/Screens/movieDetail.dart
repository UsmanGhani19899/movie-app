import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuplex/Screens/buyTicket.dart';
import 'package:nuplex/Widgets/customeButton.dart';

class MovieDetail extends StatefulWidget {
  String? movieName;
  String? moviePoster;
  String? movieDes;
  String? duration;
  MovieDetail(
      {super.key,
      this.movieName,
      this.moviePoster,
      this.movieDes,
      this.duration});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage('${widget.moviePoster}'),
              height: Get.height * 0.6,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.25,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.duration}',
                          style: GoogleFonts.openSans(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      '${widget.movieName}',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    // alignment: Alignment.center,
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
                            margin: EdgeInsets.only(
                              right: 10,
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
                  Container(
                    child: Text(
                      '${widget.movieDes}',
                      style: GoogleFonts.openSans(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              height: Get.height * 0.07,
              width: Get.width,
              child: CustomeBtn(
                btnName: 'Booking',
                onPressed: () {
                  Get.to(BuyTicket());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
