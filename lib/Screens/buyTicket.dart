import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nuplex/Widgets/customeButton.dart';
import 'package:nuplex/Widgets/iconText.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({super.key});

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

bool isSelected = false;
int? currentIndex;
int? selectedDate;
int? selectedTime;
bool isselectedDate = false;
List<int> _selectedItems = [];

class _BuyTicketState extends State<BuyTicket> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StatefulBuilder(builder: (context, snapshot) {
              return Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                // color: Colors.amber,
                padding: EdgeInsets.only(top: 20),
                height: Get.height * 0.55,
                width: Get.width,
                child: GridView.builder(
                    itemCount: 100,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.5 / 0.5, crossAxisCount: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: () {
                        //   setState(() {
                        //     isSelected = true;
                        //     currentIndex = index;
                        //   });
                        // },
                        onTap: () {
                          setState(() {
                            _selectedItems.contains(index)
                                ? _selectedItems.remove(index)
                                : _selectedItems.add(index);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: _selectedItems.contains(index)
                                  ? HexColor('#d44040')
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      );
                    }),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconText(
                  color: Colors.grey.shade200,
                  name: 'Available',
                ),
                IconText(
                  color: Colors.grey.shade900,
                  name: 'Reserved',
                ),
                IconText(
                  color: HexColor('#d44040'),
                  name: 'Selected',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 18),
              height: Get.height * 0.12,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isselectedDate = true;
                          selectedDate = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        // height: Get.height * 0.09,
                        width: Get.width * 0.18,

                        decoration: BoxDecoration(
                            color: selectedDate == index
                                ? Colors.white
                                : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'june'.toUpperCase(),
                              style: GoogleFonts.openSans(
                                  color: selectedDate == index
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '12',
                              style: GoogleFonts.openSans(
                                  color: selectedDate == index
                                      ? Colors.grey.shade900
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: Get.height * 0.06,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        // height: Get.height * 0.09,
                        width: Get.width * 0.23,

                        decoration: BoxDecoration(
                            color: selectedTime == index
                                ? Colors.white
                                : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          '09:00 Am',
                          style: GoogleFonts.openSans(
                              color: selectedTime == index
                                  ? Colors.black
                                  : Colors.grey.shade300,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Rs 750',
                      style: GoogleFonts.openSans(
                          color: HexColor('#d44040'),
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    )
                  ],
                ),
                Container(
                  width: Get.width * 0.6,
                  height: Get.height * 0.08,
                  child: CustomeBtn(
                    btnName: 'Buy a ticket',
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
