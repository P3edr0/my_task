import 'package:flutter/material.dart';
import 'package:my_task/theme/colors.dart';

class TaskMenuIcon extends StatelessWidget {
  const TaskMenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 2, width: 30, color: secondaryFocusColor),
        SizedBox(height: 4),
        Container(height: 2, width: 15, color: secondaryFocusColor),
      ],
    );
  }
}
