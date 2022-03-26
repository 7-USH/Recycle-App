// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unnecessary_this, avoid_print

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/verification_page.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key? key}) : super(key: key);
  static String id = "login";

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  bool press = false;
  Color onPressColor = const Color(0xff01661c).withOpacity(0.5);
  Color buttonColor = const Color(0xff01661c);
  final TextEditingController _controller = TextEditingController();
  bool isPhone = false;

  bool numberValidator(int number) {
    int n = number.toString().length;
    if (n == 10 && !number.toString().contains(RegExp(r'[A-Z]'))) {
      return true;
    } else {
      return false;
    }
  }

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
            Navigator.pop(context, false);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AvatarGlow(
                  endRadius: 150,
                  glowColor: Colors.blueAccent,
                  repeat: true,
                  child: Lottie.network(
                    "https://assets3.lottiefiles.com/packages/lf20_mftd0tzf.json",
                    width: 300,
                    repeat: true,
                  ),
                ),
              ),
              Text(
                "Sign Up",
                style: poppinFonts(Colors.white, FontWeight.bold, 30),
              ),
              Text(
                "Add your phone number, we'll send you a verification code \nso we know you're real",
                style: poppinFonts(Colors.white, FontWeight.normal, 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: scaffoldColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      style: poppinFonts(Colors.white, FontWeight.normal, 18),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('(+91)',
                              style: poppinFonts(
                                  Colors.white, FontWeight.normal, 15)),
                        ),
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: isPhone ? Colors.green : scaffoldColor,
                          size: 32,
                        ),
                      ),
                      onChanged: (value) {
                        isPhone =
                            this.numberValidator(int.parse(_controller.text));
                        setState(() {});
                        //TOD0: login page
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 30,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VerificationPage( phone: _controller.text,),
                    ),
                  );
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
                      "Send",
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
            ],
          ),
        ),
      ),
    );
  }
}
