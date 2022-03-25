import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';

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
        onTap: (){

          

        },
        child: Container(
            height: size.height / 3,
            width: size.width / 1.1,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.3),
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
                    child: Text("Earn points for \ndiscarded \ntrash",textAlign: TextAlign.start,
                    style: poppinFonts(scaffoldColor, FontWeight.bold, 25),),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
