// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';

class PointsPage extends StatefulWidget {
  const PointsPage({ Key? key }) : super(key: key);

  @override
  State<PointsPage> createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 600,
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 400,
                      width: width*0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFFB3E5FC),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: new Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        ),
                        ],
                      ),
                      child: Container(
                        height: 400,
                        width: 0,
                        child: Column(
                          children: [
                            Text("Earn points for",style: poppinFonts(Colors.black, FontWeight.normal, 20),),
                            Text("discarded",style: poppinFonts(Colors.black, FontWeight.normal, 20),),
                            Text("trash",style: poppinFonts(Colors.black, FontWeight.normal, 20),),
                        ],
                      ),
                      ),
                    ),
                  )
                ),
                Positioned(
                  left: 200,
                  right: 0.0,
                  top: 200,
                  bottom: 0,
                  child: Container(
                    height: 400,
                    width: 400,
                    child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Positioned(
                            height: 400,

                            child: Image.asset("assets/images/glass.png",fit: BoxFit.scaleDown,height: 100,width: 100,))
                          
                          ),
                      ),
                      ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}