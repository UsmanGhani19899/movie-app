import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconText extends StatelessWidget {
  String? name;
  final Color? color;
  IconText({super.key, this.color, this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          '$name',
          style: GoogleFonts.openSans(
              color: Colors.grey, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
