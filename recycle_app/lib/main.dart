import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/screens/confirmation_page.dart';
import 'package:recycle_app/screens/create_page.dart';
import 'package:recycle_app/screens/home.dart';
import 'package:recycle_app/screens/loading_screen.dart';
import 'package:recycle_app/screens/login_page.dart';
import 'package:recycle_app/screens/onboard_screen.dart';
import 'package:recycle_app/screens/verification_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        LoginPhone.id : (context) => const LoginPhone(),
        CreateAccountPage.id : (context) => CreateAccountPage(),
        VerificationPage.id : (context) => const VerificationPage(phone: '',),
        HomePage.id:(context)=>const HomePage(),
      }
    );
  }
}
