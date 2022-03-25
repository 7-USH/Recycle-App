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
      backgroundColor: scaffoldColor,
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
                      child: Column(
                        children: [
                          Text("Earn points for",style: poppinFonts(Colors.white, FontWeight.normal, 20),
                          Text("discarded",style: poppinFonts(Colors.white, FontWeight.normal, 20)),
                          Text("trash",style: poppinFonts(Colors.white, FontWeight.normal, 20),
                        ],
                      ),
                      
                      decoration: BoxDecoration(
                        color: Color(0xFFB3E5FC),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: new Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        ),
                        ],
                      ),
                    ),
                  )
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}