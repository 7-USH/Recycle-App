import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';

class LoginPhone extends StatefulWidget {
  LoginPhone({Key? key}) : super(key: key);
  static String id = "login";

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context,false);
          },
        ),
      ),
    );
  }
}
