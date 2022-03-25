import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:recycle_app/main.dart';
import 'package:recycle_app/screens/item_details..dart';

import '../constants/constants.dart';

class CameraPage extends StatefulWidget {
  List<CameraDescription> cameras;
  CameraPage({
    Key? key,
    required this.cameras,
  }) : super(key: key);
  static String id = "Camera Page";

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!controller.value.isInitialized) {
      return Container();
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                child: CameraPreview(controller),
                height: size.height,
                width: size.width,
              ),
              Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height / 4.5,
                        ),
                        CustomPaint(
                          foregroundPainter: BorderPainter(),
                          child: Container(
                            height: size.height / 1.8,
                            width: size.width / 1.4,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              backgroundBlendMode: BlendMode.dstOut,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: GestureDetector(
                            onTap: () async {
                              XFile? photo = await controller.takePicture();
                              if (photo != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ItemDetails(photo: photo),
                                  ),
                                );
                              }
                            },
                            child: SizedBox(
                              height: size.height / 8,
                              width: size.height / 8,
                              child: Image.network(
                                "https://www.bra.org/wp-content/uploads/icon-recycle.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double cornerSide = sh * 0.05; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
