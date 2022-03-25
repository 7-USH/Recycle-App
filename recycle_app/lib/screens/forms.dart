// ignore_for_file: unnecessary_new, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:recycle_app/constants/constants.dart';

class Formscreen extends StatefulWidget {
  static String id = "form";

  Formscreen({
    Key? key,
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
  bool press = false;
  double _slidervalue = 20;

  List list = ["Glass", "Paper/Plastic", "Electronics", "Chemical"];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? valueChoose;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("Add Details of Item",
            style: poppinFonts(Colors.white, FontWeight.normal, 25)),
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
                        controller: _idController1,
                        keyboardType: TextInputType.name,
                        style: poppinFonts(Colors.white, FontWeight.normal, 18),
                        decoration: InputDecoration(
                            hintText: "Name",
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
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: size.height / 12,
                          width: size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: DropdownButton(
                            style: poppinFonts(
                                Colors.white, FontWeight.normal, 15),
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
                              return DropdownMenuItem(value: e, child: Text(e));
                            }).toList(),
                            onChanged: (newValue) {
                              valueChoose = newValue as String;
                              setState(() { 
                              });
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
                        controller: _idController4,
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
