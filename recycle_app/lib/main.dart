import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recycle_app/screens/Points_page.dart';
=======
import 'package:recycle_app/screens/MapsPage.dart';
>>>>>>> main
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

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PointsPage(),
      routes: {
        LoginPage.id :(context) => LoginPage(),
        LoginPhone.id : (context) => const LoginPhone(),
        CreateAccountPage.id : (context) => CreateAccountPage(),
        VerificationPage.id : (context) =>const  VerificationPage(),
      
      }
    );
=======
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          LoginPage.id: (context) => LoginPage(),
          LoginPhone.id: (context) => const LoginPhone(),
          CreateAccountPage.id: (context) => CreateAccountPage(),
          VerificationPage.id: (context) => const VerificationPage(
                phone: '',
              ),
          HomePage.id: (context) => const HomePage(),
          MapsPage.id: (context) => const MapsPage()
        });
>>>>>>> main
  }
}
