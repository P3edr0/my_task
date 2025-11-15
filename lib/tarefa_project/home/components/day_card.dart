import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class TaskDayCard extends StatelessWidget {
  const TaskDayCard({super.key, required this.day, required this.dayLetter});
  final String day;
  final String dayLetter;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: Responsive.getSizeValue(65),
      height: Responsive.getSizeValue(65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
        border: Border.all(color: primaryColor, width: 2),
      ),
      child: Column(
        children: [
          Text(day, style: TaskFontStyle.h3Bold),
          Text(
            dayLetter,
            style: TaskFontStyle.bodyBold.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
