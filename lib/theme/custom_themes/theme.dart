import 'package:flutter/material.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/theme/text_theme/text_theme.dart';

class TaskAppTheme {
  TaskAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    focusColor: secondaryColor,
    fontFamily: 'roboto',
    textTheme: TaskTextTheme.lightTextTheme,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: primaryColor,
    focusColor: secondaryFocusColor,
    fontFamily: 'roboto',
    textTheme: TaskTextTheme.darkTextTheme,
    useMaterial3: true,
  );
}
