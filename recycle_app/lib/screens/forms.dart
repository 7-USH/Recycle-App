// ignore_for_file: unnecessary_new, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:recycle_app/constants/constants.dart';

class Formscreen extends StatefulWidget {
  static String id = "form";

  String ImageURL;
  Formscreen({
    Key? key,
    required this.ImageURL,
  }) : super(key: key);

  @override
  State<Formscreen> createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  TextEditingController _idController1 = new TextEditingController();
  TextEditingController _idController2 = new TextEditingController();
  TextEditingController _idController3 = new TextEditingController();
  TextEditingController _noController = new TextEditingController();
  TextEditingController _idController4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Details of Item",
          style: TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
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
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/form.png",
              height: 160,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(25)),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Userid cannot be empty';
                          }
                          return null;
                        },
                        controller: _idController1,
                        keyboardType: TextInputType.name,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                            hintText: "UserID",
                            hintStyle: poppinFonts(
                                Colors.white, FontWeight.normal, 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            )),
                        onChanged: (value) {
                          //TOD0: login page
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(25)),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Type of material cannot be empty';
                          }
                          return null;
                        },
                        controller: _idController2,
                        keyboardType: TextInputType.multiline,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                            hintText: "Type of material",
                            hintStyle: poppinFonts(
                                Colors.white, FontWeight.normal, 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: const Icon(
                              Icons.border_color,
                              color: Colors.white,
                              size: 30,
                            )),
                        onChanged: (value) {
                          //TOD0: login page
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(25)),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Weight cannot be empty';
                          }
                          return null;
                        },
                        controller: _idController3,
                        keyboardType: TextInputType.number,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                            hintText: "Weight in kg's ",
                            hintStyle: poppinFonts(
                                Colors.white, FontWeight.normal, 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 30,
                            )),
                        onChanged: (value) {
                          //TOD0: login page
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(25)),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Description cannot be empty';
                          }
                          return null;
                        },
                        controller: _idController4,
                        keyboardType: TextInputType.multiline,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                          hintText: "Decription of the material",
                          hintStyle:
                              poppinFonts(Colors.white, FontWeight.normal, 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(
                            Icons.description,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        onChanged: (value) {
                          //TOD0: login page
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(30)),
                      ElevatedButton(
                        onPressed: () async {},
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 25,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
