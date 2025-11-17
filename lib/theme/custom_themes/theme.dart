import 'package:flutter/material.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/theme/text_theme/text_theme.dart';

class TaskAppTheme {
  TaskAppTheme._();

  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: primaryFocusColor.withValues(alpha: 0.3),
      selectionHandleColor: primaryFocusColor,
    ),

    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: secondaryColor,
      surface: secondaryColor,
      onSurface: secondaryFocusColor,
    ),
    fontFamily: 'lexend',
    textTheme: TaskTextTheme.lightTextTheme,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: primaryFocusColor.withValues(alpha: 0.3),
      selectionHandleColor: primaryFocusColor,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: secondaryFocusColor,
      surface: secondaryColor,
      onSurface: secondaryFocusColor,
    ),
    fontFamily: 'lexend',
    textTheme: TaskTextTheme.darkTextTheme,
    useMaterial3: true,
  );
}
