import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeField extends StatefulWidget {
  final String? fieldName;
  int? maxline;
  TextEditingController? controller;
  CustomeField({super.key, this.controller, this.fieldName, this.maxline});

  @override
  State<CustomeField> createState() => _CustomeFieldState();
}

class _CustomeFieldState extends State<CustomeField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      child: TextFormField(
        style: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.w600),
        controller: widget.controller,
        onChanged: (value) {
          setState(() {
            value = widget.controller!.text;
          });
        },
        maxLines: widget.maxline,
        validator: (val) => widget.controller!.text.isEmpty
            ? "Please Enter ${widget.fieldName}"
            : null,
        decoration: InputDecoration(
            filled: true,
            hintText: '${widget.fieldName}',
            hintStyle: GoogleFonts.roboto(
                color: Colors.grey, fontWeight: FontWeight.w600),
            fillColor: Colors.grey.shade900.withOpacity(0.5),
            border: OutlineInputBorder(borderSide: BorderSide())),
      ),
    );
  }
}
