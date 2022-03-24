// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/create_page.dart';
import 'package:recycle_app/screens/login_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static String id = "loginpage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool press1 = false;
  bool press2 = false;
  Color onPressColor = const Color(0xff01661c).withOpacity(0.5);
  Color buttonColor = const Color(0xff01661c);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: size.width / 5,
                ),
                Text(
                  'Re',
                  style: poppinFonts(Colors.white, FontWeight.bold, 50),
                ),
                DefaultTextStyle(
                  style: poppinFonts(Colors.white, FontWeight.bold, 50),
                  child: Center(
                    child: Container(
                      width: size.width / 2,
                      height: size.height / 3.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText('cycle'),
                              RotateAnimatedText('duce'),
                              RotateAnimatedText('use'),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Center(
              child: Text(
                "Lets get Started",
                style: poppinFonts(Colors.white, FontWeight.w600, 20),
              ),
            ),
            Center(
              child: Text(
                "Never a better time than now to start.",
                style: poppinFonts(Colors.white, FontWeight.normal, 15),
              ),
            ),
            GestureDetector(
              onTap: () async {
              setState(() {
                    press1 = !press1;
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      press1 = !press1;
                    });
                  });
                  await Navigator.pushNamed(context, CreateAccountPage.id);
              },
              child: Container(
                width: size.width / 1.1,
                height: size.height / 13,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: press1
                            ? [Colors.blue, Colors.red]
                            : [
                                const Color(0xff00548e),
                                const Color(0xff009297)
                              ]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: kButtonShadows),
                child: const Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()  async{
                setState(() {
                    press2 = !press2;
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      press2 = !press2;
                    });
                  });
                  await Navigator.pushNamed(context, LoginPhone.id);
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
                                const Color(0xff009297)
                              ]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: kButtonShadows),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 7,
            ),
          ],
        ),
      ),
    );
  }
}
