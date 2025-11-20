import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class TaskButton extends StatelessWidget {
  const TaskButton({super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: primaryColor),
        ),

        padding: EdgeInsets.symmetric(
          horizontal: Responsive.getSizeValue(30),
          vertical: Responsive.getSizeValue(4),
        ),
        child: Text(
          title,
          style: TaskFontStyle.h4LargeBold.copyWith(color: secondaryColor),
        ),
      ),
    );
  }
}
