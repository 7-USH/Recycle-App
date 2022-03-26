import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/confirmation_page.dart';
import 'package:recycle_app/screens/loading_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static String id = "OnBoard";

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  bool press = false;
  Color onPressColor = const Color(0xff01661c).withOpacity(0.5);
  Color buttonColor = const Color(0xff01661c);

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      return LoadingScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 15,
            ),
            Center(
              child: AvatarGlow(
                  endRadius: 180,
                  repeat: true,
                  showTwoGlows: true,
                  duration: const Duration(milliseconds: 2000),
                  child: Center(
                      child: Lottie.network(
                          "https://assets3.lottiefiles.com/private_files/lf30_iqdiamlq.json"))),
            ),
            Text(
              "Save our planet!",
              style: poppinFonts(Colors.white, FontWeight.bold, 30),
            ),
            Text(
              "Sort trash with other users\nand help save the planet for posterity",
              style: poppinFonts(
                  Colors.white, FontWeight.normal, size.height / 50),
              textAlign: TextAlign.left,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    press = !press;
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      press = !press;
                    });
                  });
                  await Navigator.pushNamed(context, LoginPage.id);
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
                                  const Color(0xff009297)
                                ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: kButtonShadows),
                  child: const Center(
                    child: Text(
                      "Start",
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
    );
  }
}
