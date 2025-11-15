import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/responsiveness/responsive.dart';

abstract class TaskFontStyle {
  static TextStyle h0 = GoogleFonts.lexend().copyWith(
    height: Responsive.getFontValue(60),
    color: Colors.black,
  );
  static TextStyle titleLarge = GoogleFonts.lexend().copyWith(
    height: Responsive.getFontValue(54),
    color: Colors.black,
  );

  static TextStyle h1 = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(50),
    color: Colors.black,
  );
  static TextStyle h2 = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(40),
    color: Colors.black,
  );
  static TextStyle h3 = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(28),
    color: Colors.black,
  );
  static TextStyle h4 = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(20),
    color: Colors.black,
  );
  static TextStyle bodyLarge = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(16),
    color: Colors.black,
  );
  static TextStyle title = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(18),
    color: Colors.black,
  );
  static TextStyle body = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(14),
    color: Colors.black,
  );
  static TextStyle small = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(12),
    color: Colors.black,
  );
  static TextStyle verySmall = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(10),
    color: Colors.black,
  );
  static TextStyle h0Bold = GoogleFonts.lexend().copyWith(
    height: Responsive.getFontValue(60),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLargeBold = GoogleFonts.lexend().copyWith(
    height: Responsive.getFontValue(54),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  //+++++++++++++++++++  BOLD FONTS +++++++++++++++++++++++++++++++++++++++
  static TextStyle h1Bold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(50),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2Bold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(40),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h3Bold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(28),
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );
  static TextStyle h4Bold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(20),
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );
  static TextStyle bodyLargeBold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(16),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleBold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(18),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bodyBold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(14),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle smallBold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(12),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle verySmallBold = GoogleFonts.lexend().copyWith(
    fontSize: Responsive.getFontValue(10),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
