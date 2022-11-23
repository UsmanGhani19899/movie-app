import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  final String? fieldName;
  TextEditingController? controller;
  PasswordField({super.key, this.controller, this.fieldName});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

bool isObscure = true;

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      child: TextFormField(
        style: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.w600),
        obscureText: isObscure,
        controller: widget.controller,
        onChanged: (value) {
          setState(() {
            value = widget.controller!.text;
          });
        },
        validator: (val) => widget.controller!.text.isEmpty
            ? "Please Enter ${widget.fieldName}"
            : null,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  FeatherIcons.eye,
                  color: Colors.white,
                )),
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
