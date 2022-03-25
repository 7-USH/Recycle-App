import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycle_app/constants/constants.dart';
class Formscreen extends StatefulWidget {
  const Formscreen({ Key? key }) : super(key: key);
  static String id = "form";


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
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldColor,
        body: Container(
          child: 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                
                children:<Widget> [
                  Padding(padding: EdgeInsets.all(30)),
                  TextFormField(
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'Userid cannot be empty';
                      }
                      return null;
                    },
                      controller: _idController1,
                      keyboardType: TextInputType.name,
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

                  Padding(padding: EdgeInsets.all(30)),
                  TextFormField(
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return'Type of material cannot be empty';
                      }
                      return null;
                    },
                      controller: _idController2,
                      keyboardType: TextInputType.multiline,
                      style: poppinFonts(Colors.white, FontWeight.normal, 18),
                      decoration: InputDecoration(
                          hintText: "Type of material",
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
                    Padding(padding: EdgeInsets.all(30)),
                    TextFormField(
                      
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return'Weight cannot be empty';
                      }
                      return null;
                    },
                      controller: _idController3,
                      keyboardType: TextInputType.number,
                      style: poppinFonts(Colors.white, FontWeight.normal, 18),
                      decoration: InputDecoration(
                          hintText: "Weight in kg's ",
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
                    Padding(padding: EdgeInsets.all(30)),
                  TextFormField(
                    
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return ' Description cannot be empty';
                      }
                      return null;
                    },
                      controller: _idController4,
                      keyboardType: TextInputType.multiline,
                      style: poppinFonts(Colors.white, FontWeight.normal, 18),
                      decoration: InputDecoration(
                          hintText: "Decription of the material ",
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
                  
                  
                ],
              )
              ),
            ),
        ),
        
      ),
    );
  }
}