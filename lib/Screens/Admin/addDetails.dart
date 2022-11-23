import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuplex/Core/database.dart';
import 'package:nuplex/Screens/signup.dart';
import 'package:nuplex/Widgets/customeButton.dart';
import 'package:nuplex/Widgets/customeField.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

TextEditingController movieNameController = TextEditingController();
TextEditingController movieDesController = TextEditingController();
bool addMore = false;
// final List<TextField> fieldsa = [];

class _AddDetailsState extends State<AddDetails> {
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
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: imageFile == null
                      ? Container(
                          height: Get.height * 0.4,
                          width: Get.width,
                          color: Colors.grey.shade900.withOpacity(0.4),
                        )
                      : Container(
                          height: Get.height * 0.4,
                          width: Get.width,
                          child: Image(
                            image: FileImage(imageFile!),
                            fit: BoxFit.cover,
                          ),
                        )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      child: CustomeField(
                        maxline: 1,
                        fieldName: 'Movie Name',
                        controller: movieNameController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      child: CustomeField(
                        maxline: 15,
                        fieldName: 'Movie Description',
                        controller: movieDesController,
                      ),
                    ),
                  ],
                ),
              ),
              CustomeBtn(
                btnName: 'Add',
                onPressed: () {
                  Database().InCinema(
                      context: context,
                      description: movieDesController.text,
                      image: url,
                      name: movieNameController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
