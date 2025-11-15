import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTextTheme {
  TaskTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyMedium: GoogleFonts.interTextTheme().bodyMedium!.copyWith(
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.interTextTheme().headlineLarge!.copyWith(
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.interTextTheme().headlineMedium!.copyWith(
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyMedium: GoogleFonts.interTextTheme().bodyMedium!.copyWith(
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.interTextTheme().headlineLarge!.copyWith(
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.interTextTheme().headlineMedium!.copyWith(
      color: Colors.white,
    ),
  );
}
