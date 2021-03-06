import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/camera_page.dart';
import 'package:recycle_app/screens/photo_page.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({Key? key}) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CameraPage.id);
        },
        child: Container(
            height: size.height / 3,
            width: size.width / 1.1,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(20),
              boxShadow: kButtonShadows,
            ),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: LottieBuilder.network(
                      "https://assets10.lottiefiles.com/packages/lf20_rqes9zyp.json",
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Earn points for \ndiscarded \ntrash",
                      textAlign: TextAlign.start,
                      style: poppinFonts(Colors.white, FontWeight.bold, 25),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
