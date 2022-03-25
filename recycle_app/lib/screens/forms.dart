// ignore_for_file: unnecessary_new, prefer_final_fields, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:recycle_app/constants/constants.dart';

import '../service/location.dart';

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
  TextEditingController _userName = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  String uploadCode = DateTime.now().hashCode.toString();

  bool press = false;
  double _slidervalue = 20;
  late Map<String, dynamic> userData;
  late LatLng myLocation;

  List list = ["Glass", "Paper", "Plastic", "Electronics", "Chemicals"];
  String? valueChoose;
  late double latitude = 0;
  late double longitude = 0;

  getLocation() async {
    MyLocation location = MyLocation();
    await location.getCurrentLocation();
    latitude = await location.getLatitude();
    myLocation = LatLng(latitude, longitude);
    print(latitude);
    longitude = await location.getLongitude();
    print(longitude);
    setState(() {});
    return myLocation;
  }

  void addData() {
    userData = {
      "username": _userName.text,
      "Description": _description.text,
      "latitude": latitude,
      "longitude": longitude,
      "image": widget.ImageURL,
    };
    FirebaseFirestore.instance
        .collection(valueChoose!)
        .doc(uploadCode)
        .set(userData);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Add Details of Item",
          style: poppinFonts(
            Colors.white,
            FontWeight.normal,
            25,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Userid cannot be empty';
                          }
                          return null;
                        },
                        controller: _userName,
                        keyboardType: TextInputType.name,
                        style: poppinFonts(
                          Colors.white,
                          FontWeight.normal,
                          18,
                        ),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle:
                              poppinFonts(Colors.white, FontWeight.normal, 15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        onChanged: (value) {
                          //TOD0: login page
                        },
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: size.height / 10,
                          width: size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Text(
                                "Select Material Type",
                                style: poppinFonts(
                                  Colors.white,
                                  FontWeight.normal,
                                  15,
                                ),
                              ),
                            ),
                            disabledHint: Text(
                              "Select Material Type",
                              style: poppinFonts(
                                Colors.white,
                                FontWeight.normal,
                                15,
                              ),
                            ),
                            itemHeight: 100,
                            alignment: AlignmentDirectional.center,
                            style: poppinFonts(
                              Colors.white,
                              FontWeight.normal,
                              15,
                            ),
                            dropdownColor: scaffoldColor,
                            iconSize: 30,
                            underline: const SizedBox(),
                            isExpanded: true,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 40,
                              color: Colors.white,
                            ),
                            value: valueChoose,
                            items: list.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: SizedBox(
                                  width: 140,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      e,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              valueChoose = newValue as String;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Weight cannot be empty';
                          }
                          return null;
                        },
                        controller: _weight,
                        keyboardType: TextInputType.number,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                          hintText: "Weight in kg's ",
                          hintStyle:
                              poppinFonts(Colors.white, FontWeight.normal, 15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        onChanged: (value) {
                          //TOD0: login page
                        },
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextFormField(
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Description cannot be empty';
                          }
                          return null;
                        },
                        controller: _description,
                        keyboardType: TextInputType.multiline,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                          hintText: "Description of the material",
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
                      SizedBox(
                        height: size.height / 15,
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
                          addData();
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
                              "Submit",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
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
