import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTextTheme {
  TaskTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyMedium: GoogleFonts.lexendTextTheme().bodyMedium!.copyWith(
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.lexendTextTheme().headlineLarge!.copyWith(
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.lexendTextTheme().headlineMedium!.copyWith(
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyMedium: GoogleFonts.lexendTextTheme().bodyMedium!.copyWith(
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.lexendTextTheme().headlineLarge!.copyWith(
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.lexendTextTheme().headlineMedium!.copyWith(
      color: Colors.white,
    ),
  );
}
