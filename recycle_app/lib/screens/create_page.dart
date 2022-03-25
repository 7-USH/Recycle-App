// ignore_for_file: unnecessary_new

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);
  static String id = "createAccount";

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _idController = new TextEditingController();
  TextEditingController _noController = new TextEditingController();
    bool press = false;
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: AvatarGlow(
                endRadius: 150,
                child: LottieBuilder.network(
                  "https://assets7.lottiefiles.com/private_files/lf30_9lkmjxia.json",
                  width: 300,
                ),
              ),
            ),
            Text(
              "Registration",
              style: poppinFonts(Colors.white, FontWeight.bold, 30),
            ),
            Text(
              "Pick a username and add your phone number, we'll send you a \nverification code so we know you're real",
              style: poppinFonts(Colors.white, FontWeight.normal, 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                TextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  style: poppinFonts(Colors.white, FontWeight.normal, 18),
                  decoration: InputDecoration(
                      hintText: "UserID",
                      hintStyle:
                          poppinFonts(Colors.white, FontWeight.normal, 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      )),
                  onChanged: (value) {
                    //TOD0: login page
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _noController,
                  keyboardType: TextInputType.number,
                  style: poppinFonts(Colors.white, FontWeight.normal, 18),
                  decoration: InputDecoration(
                        hintText: "Phone-number",
                    hintStyle: poppinFonts(Colors.white, FontWeight.normal, 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    prefix: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('(+91)',
                          style:
                              poppinFonts(Colors.white, FontWeight.normal, 15)),
                    ),
                  ),
                  onChanged: (value) {
                    //TOD0: login page
                  },
                  
                ),
                  const SizedBox(
                  height: 20,
                ),
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

                    //TODO:

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
                        "Send",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
