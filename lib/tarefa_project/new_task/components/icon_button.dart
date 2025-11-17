import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/theme/colors.dart';

class TaskIconButton extends StatelessWidget {
  const TaskIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.color = secondaryFocusColor,
  });
  final void Function() onTap;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, color: color, size: Responsive.getSizeValue(28)),
    );
  }
}
