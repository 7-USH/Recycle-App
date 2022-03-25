// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/camera_page.dart';
import 'package:recycle_app/screens/confirm_picture.dart';

class PhotoPage extends StatefulWidget {
  PhotoPage({Key? key}) : super(key: key);

  static String id = "Photo Page";

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  bool press = false;
  bool press2 = false;

  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LottieBuilder.network(
                "https://assets10.lottiefiles.com/packages/lf20_0zv8teye.json",
              ),
              Text(
                "Upload Item Image",
                textAlign: TextAlign.center,
                style: poppinFonts(
                  Colors.white,
                  FontWeight.bold,
                  30,
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        press = !press;
                      });
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          press = !press;
                        });
                      });
                      Navigator.pushNamed(context, CameraPage.id);
                    },
                    child: Container(
                      width: size.width / 1.1,
                      height: size.height / 13,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: press
                              ? [Colors.blue, Colors.red]
                              : [
                                  const Color(0xff00548e),
                                  const Color(0xff009297),
                                ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: kButtonShadows,
                      ),
                      child: const Center(
                        child: Text(
                          "Camera",
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
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        press2 = !press2;
                      });
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          press2 = !press2;
                        });
                      });
                      final ImagePicker _picker = ImagePicker();
                      final XFile? photo = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (photo != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmPicture(photo: photo),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: size.width / 1.1,
                      height: size.height / 13,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: press2
                                ? [Colors.blue, Colors.red]
                                : [
                                    const Color(0xff00548e),
                                    const Color(0xff009297),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: kButtonShadows),
                      child: const Center(
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
