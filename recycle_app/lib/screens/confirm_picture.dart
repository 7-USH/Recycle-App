import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:recycle_app/constants/constants.dart';

class ConfirmPicture extends StatelessWidget {
  final XFile? photo;
  static String id = "Item Details";
  const ConfirmPicture({
    Key? key,
    required this.photo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: ClipRect(
                child: Image.file(
                  File(photo!.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  "Scan Trash",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          width: size.width / 1.2,
                          height: size.height / 13,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xff00548e),
                                const Color(0xff009297)
                              ]),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: kButtonShadows),
                          child: const Center(
                            child: Text(
                              "Confirm Picture",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}