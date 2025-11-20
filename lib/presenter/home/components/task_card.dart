import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.content,
    required this.time,
    required this.prefix,
  });
  final String title;
  final String content;
  final String time;
  final Widget prefix;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: Responsive.getSizeValue(16),
            right: Responsive.getSizeValue(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.getSizeValue(16),
            vertical: Responsive.getSizeValue(16),
          ),
          height: Responsive.getSizeValue(150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: secondaryColor,
            border: Border.all(color: primaryColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prefix,
              SizedBox(
                width: Responsive.getSizeValue(200),
                child: Column(
                  children: [
                    Text(title, style: TaskFontStyle.h4Bold),
                    SizedBox(height: Responsive.getSizeValue(8)),
                    Text(
                      content,
                      textAlign: TextAlign.end,
                      style: TaskFontStyle.body.copyWith(color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 8,
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              color: secondaryFocusColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.getSizeValue(12),
              vertical: Responsive.getSizeValue(5),
            ),
            child: Text(
              time,
              textAlign: TextAlign.end,
              style: TaskFontStyle.bodyBold.copyWith(color: secondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
