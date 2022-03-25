import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<BoxShadow> kBoxShadows = [
  BoxShadow(
      color: Colors.black.withOpacity(0.4),
      offset: const Offset(0.6, 4),
      spreadRadius: 1,
      blurRadius: 8),
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      offset: const Offset(-3, -4),
      spreadRadius: -2,
      blurRadius: 20),
];

List<BoxShadow> kButtonShadows = [
  BoxShadow(
      color: Colors.black.withOpacity(0.2),
      offset: const Offset(0.6, 4),
      spreadRadius: 1,
      blurRadius: 8)
];

TextStyle poppinFonts(Color color, FontWeight fontWeight, double size) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight);
}

Color scaffoldColor = const Color(0xff181920);
