import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class TaskDayCard extends StatelessWidget {
  const TaskDayCard({
    super.key,
    required this.day,
    required this.dayLetter,
    required this.isSelected,
    required this.onTap,
  });
  final String day;
  final String dayLetter;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Responsive.getSizeValue(65),
        height: Responsive.getSizeValue(65),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? primaryColor : secondaryColor,
          border: Border.all(color: primaryColor, width: 2),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TaskFontStyle.h3Bold.copyWith(
                color: isSelected ? secondaryColor : secondaryFocusColor,
              ),
            ),
            Text(
              dayLetter,
              style: TaskFontStyle.bodyBold.copyWith(
                color: isSelected ? secondaryColor : primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
