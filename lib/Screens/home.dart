import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuplex/Core/auth.dart';
import 'package:nuplex/Screens/movieDetail.dart';
import 'package:nuplex/Screens/signIn.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            // alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      // width: Get.width * 0.3,
                      child: Text(
                        'InCinema'.toUpperCase(),
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // color: Colors.white,
                      height: Get.height * 0.4,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('InCinema')
                              .snapshots(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                Map<String, dynamic> inCinema =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(MovieDetail(
                                      movieName: inCinema['movieName'],
                                      moviePoster: inCinema['moviePoster'],
                                      movieDes: inCinema['movieDes'],
                                      duration: inCinema['duration'],
                                    ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: Get.height * 0.25,
                                          width: Get.width * 0.35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${inCinema['moviePoster']}'),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: Get.width * 0.3,
                                          child: Text(
                                            '${inCinema['movieName']}',
                                            style: GoogleFonts.openSans(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        ElevatedButton(
                                            child: Text('Logout'),
                                            onPressed: () async {
                                              await Auth().logout();
                                            }),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              // options: CarouselOptions(
                              //   height: Get.height * 0.4,
                              //   enlargeCenterPage: true,
                              //   autoPlay: false,
                              //   aspectRatio: 16 / 9,
                              //   disableCenter: true,
                              //   pageSnapping: true,
                              //   autoPlayCurve: Curves.fastOutSlowIn,
                              //   enableInfiniteScroll: true,
                              //   autoPlayAnimationDuration:
                              //       Duration(milliseconds: 800),
                              //   viewportFraction: 0.7,
                              // ),
                              // reverse: false,
                              // allowImplicitScrolling: true,
                              // pageSnapping: true,
                            );
                          }),
                    ),
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       Icons.watch_later_outlined,
                //       color: Colors.grey,
                //       size: 15,
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                // Text(
                //   '${movieDetail['duration']}',
                //   style: GoogleFonts.openSans(
                //       color: Colors.grey,
                //       fontWeight: FontWeight.w500),
                // ),
                //   ],
                // ),
                // Container(
                //   width: Get.width * 0.8,
                //   child: Text(
                //     'Doctor Strange in the Multiverse of Madness',
                //     style: GoogleFonts.openSans(
                //         color: Colors.white,
                //         fontWeight: FontWeight.w700,
                //         fontSize: 25),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 25),
                //   alignment: Alignment.center,
                //   height: Get.height * 0.05,
                //   width: Get.width,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 3,
                //       itemBuilder: (contxt, index) {
                //         return Container(
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //               color: Colors.grey.shade900,
                //               borderRadius:
                //                   BorderRadius.circular(22)),
                //           padding: EdgeInsets.symmetric(
                //             horizontal: 20,
                //           ),
                //           margin: EdgeInsets.symmetric(
                //             horizontal: 10,
                //           ),
                //           child: Text(
                //             'Action',
                //             style: GoogleFonts.openSans(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         );
                //       }),
                // ),
                // Divider(
                //   color: Colors.grey,
                // )
              ],
            )),
      ),
    );
  }
}
