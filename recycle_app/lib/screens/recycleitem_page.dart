import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';

class RecycleItemPage extends StatelessWidget {
  final dynamic item;
  final int index;
  const RecycleItemPage({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: size.width / 1.6,
                child: Image.network(
                  item[index]['image'],
                  fit: BoxFit.cover,
                ),
                height: size.height / 3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Text(
              item[index]['type'],
              style: poppinFonts(Colors.white, FontWeight.w500, 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              item[index]['Description'],
              style: poppinFonts(Colors.white, FontWeight.w200, 20),
            ),
          )
        ],
      ),
    );
  }
}
