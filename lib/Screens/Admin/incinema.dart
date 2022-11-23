import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuplex/Screens/Admin/addDetails.dart';

import '../movieDetail.dart';

class InCinema extends StatefulWidget {
  String? name;
  InCinema({super.key, this.name});

  @override
  State<InCinema> createState() => _InCinemaState();
}

class _InCinemaState extends State<InCinema> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Ininema',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AddDetails());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12),
        // color: Colors.white,

        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('InCinema').snapshots(),
            builder: (context, snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.85 / 3, crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  Map<String, dynamic> inCinema =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage('${inCinema['moviePoster']}'),
                            height: Get.height * 0.3,
                            width: Get.width * 0.45,
                            fit: BoxFit.cover,
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
    ));
  }
}
