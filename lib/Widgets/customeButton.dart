import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomeBtn extends StatelessWidget {
  String? btnName;
  final onPressed;
  CustomeBtn({super.key, this.btnName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        '$btnName',
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: HexColor('#d44040'), elevation: 0),
    );
  }
}
