import 'dart:io';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nuplex/Core/auth.dart';
import 'package:nuplex/Widgets/customeButton.dart';
import 'package:nuplex/Widgets/customeField.dart';
import 'package:nuplex/Widgets/passwordField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  FirebaseStorage storage = FirebaseStorage.instance;
  var url = '';
  File? imageFile;
  var selectedImagePath = '';
  var selectedImageSize = '';
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        selectedImagePath = pickedFile.path;
        selectedImageSize =
            ((File(selectedImagePath)).lengthSync() / 1024 / 1024)
                    .toStringAsFixed(2) +
                " Mb";
      });

      uploadImageToFirebase();
    } else {
      Get.snackbar("Error !", "No Photo Selected",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white);
    }
  }

  Future uploadImageToFirebase() async {
    // showLoadingIndicator();
    Reference firebaseStorageRef =
        storage.ref().child('uploads/${selectedImagePath}');
    UploadTask uploadTask = firebaseStorageRef.putFile(imageFile!);
    uploadTask.then((res) async {
      url = await res.ref.getDownloadURL();
      print(url);

      //hideLoadingIndicator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.9,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    height: Get.height * 0.3,
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: HexColor('#d44040'),
                        )),
                    child: imageFile == null
                        ? Icon(
                            FeatherIcons.camera,
                            color: Colors.white,
                          )
                        : Image(image: FileImage(imageFile!)),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomeField(
                        controller: nameController,
                        fieldName: 'Name',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomeField(
                        controller: emailController,
                        fieldName: 'Email',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordField(
                        controller: passwordController,
                        fieldName: 'Password',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width * 0.8,
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.roboto(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomeBtn(
                  btnName: 'SignUp',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Auth().signUp(context, nameController.text,
                          emailController.text, passwordController.text, url);
                    } else {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
