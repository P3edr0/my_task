import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/utils/enums/category.dart';

class TaskCategorySelector extends StatelessWidget {
  const TaskCategorySelector({
    super.key,
    required this.isSelected,
    required this.isFirst,
    required this.category,
    required this.onTap,
  });

  final bool isSelected;
  final bool isFirst;
  final Category category;
  final void Function(Category category) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: Responsive.getSizeValue(16),
        left: isFirst ? Responsive.getSizeValue(24) : 0,
      ),
      child: InkWell(
        splashColor: transparent,
        onTap: () {
          onTap(category);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: isSelected ? primaryColor : primaryFocusColor,
            ),
          ),

          padding: EdgeInsets.symmetric(
            horizontal: Responsive.getSizeValue(12),
            vertical: Responsive.getSizeValue(6),
          ),
          child: Text(
            category.toString(),
            style: TaskFontStyle.bodyBold.copyWith(
              color: isSelected ? secondaryColor : primaryFocusColor,
            ),
          ),
        ),
      ),
    );
  }
}
