import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    required this.controller,
    this.focus,
    required this.hint,
    this.maxLen = 2,
    this.keyboardType = TextInputType.text,
    this.formatters,
    this.action = TextInputAction.next,
  });
  final TextEditingController controller;
  final int maxLen;
  final FocusNode? focus;
  final String? hint;
  final TextInputType keyboardType;
  final TextInputAction action;
  final List<TextInputFormatter>? formatters;
  @override
  Widget build(BuildContext context) {
    SizedBox(height: Responsive.getSizeValue(24));
    return TextField(
      controller: controller,
      cursorColor: primaryFocusColor,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: action,
      inputFormatters: formatters,
      style: TaskFontStyle.h4Bold,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TaskFontStyle.title.copyWith(color: primaryFocusColor),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryFocusColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryFocusColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryFocusColor),
        ),
      ),
    );
  }
}
