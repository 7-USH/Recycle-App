import 'package:flutter/material.dart';
import 'package:recycle_app/screens/confirmation_page.dart';
import 'package:recycle_app/screens/create_page.dart';
import 'package:recycle_app/screens/login_page.dart';
import 'package:recycle_app/screens/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardScreen(),
      routes: {
        LoginPage.id :(context) => LoginPage(),
        LoginPhone.id : (context) => LoginPhone(),
        CreateAccountPage.id : (context) => CreateAccountPage()
      }
    );
  }
}
