import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';

class RecycleItemPage extends StatefulWidget {
  RecycleItemPage({Key? key}) : super(key: key);
  static String id = "recyclepage";

  @override
  State<RecycleItemPage> createState() => _RecycleItemPageState();
}

class _RecycleItemPageState extends State<RecycleItemPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: "1", child: 
    Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    ));
  }
}
