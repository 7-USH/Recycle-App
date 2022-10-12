import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/forms.dart';
import 'package:recycle_app/screens/loading_screen.dart';

class ConfirmPicture extends StatefulWidget {
  final XFile? photo;

  static String id = "Item Details";
  const ConfirmPicture({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  State<ConfirmPicture> createState() => _ConfirmPictureState();
}

class _ConfirmPictureState extends State<ConfirmPicture> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.file(
                File(widget.photo!.path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: size.height / 20,
                right: size.width / 1.2,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: scaffoldColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            Positioned(
              bottom: size.height / 100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: GestureDetector(
                  onTap: () async {
                  //   Future.delayed(Duration(seconds: 3), () {
                  //   Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => LoadingScreen()),
                  //       ModalRoute.withName(ConfirmPicture.id));
                  // });
                    setState(() {});
                    String downloadURL = "";
                    if (widget.photo == null) return;
                    final destination = "${DateTime.now().hashCode}";

                    await FirebaseStorage.instance
                        .ref(destination)
                        .putFile(File(widget.photo!.path));
                    downloadURL = await FirebaseStorage.instance
                        .ref(destination)
                        .getDownloadURL();
                    print("IMAGE URL : " + downloadURL);
                    setState(() {
                      
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Formscreen(ImageURL: downloadURL);
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: size.width / 1.2,
                    height: size.height / 13,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff00548e), Color(0xff009297)]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: kButtonShadows),
                    child: const Center(
                      child: Text(
                        "Confirm Picture",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
