import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static String id = "loading";

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Recycling...",style: poppinFonts(Colors.white, FontWeight.bold, 30),),
          Center(
            child: LottieBuilder.network(
                "https://assets10.lottiefiles.com/packages/lf20_lcoullus.json",
                width: 200,),
          ),
        ],
      ),
    );
  }
}
