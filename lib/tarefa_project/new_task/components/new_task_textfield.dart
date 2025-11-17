import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class NewTaskTextField extends StatelessWidget {
  const NewTaskTextField({
    super.key,
    required this.title,
    required this.controller,
    this.focus,
    required this.hint,
    this.maxLen = 2,
    this.keyboardType = TextInputType.text,
    this.formatters,
    this.isSmall = false,
    this.action = TextInputAction.next,
  });
  final String title;
  final TextEditingController controller;
  final int maxLen;
  final FocusNode? focus;
  final String? hint;
  final TextInputType keyboardType;
  final TextInputAction action;
  final List<TextInputFormatter>? formatters;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    final hintColor = secondaryFocusColor.withValues(alpha: 0.4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TaskFontStyle.title.copyWith(color: primaryColor)),

        TextField(
          controller: controller,
          cursorColor: primaryFocusColor,
          focusNode: focus,
          keyboardType: keyboardType,
          textInputAction: action,
          inputFormatters: formatters,
          style: isSmall ? TaskFontStyle.titleBold : TaskFontStyle.h4Bold,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                isSmall
                    ? TaskFontStyle.titleBold.copyWith(color: hintColor)
                    : TaskFontStyle.h4Bold.copyWith(color: hintColor),
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
        ),
      ],
    );
  }
}
