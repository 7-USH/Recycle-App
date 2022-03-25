import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';

class ListCard extends StatefulWidget {
   ListCard({Key? key,required this.imgUrl,required this.color}) : super(key: key);
  String imgUrl;
  Color color;


  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          height: 150,
          width: 140,
          decoration: BoxDecoration(
            boxShadow: kButtonShadows,
              color: widget.color, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(widget.imgUrl),
          )),
    );
  }
}
