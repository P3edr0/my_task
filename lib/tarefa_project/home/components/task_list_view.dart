import 'package:flutter/material.dart';
import 'package:my_task/domain/entities/task_entity.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/tarefa_project/home/components/task_card.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/utils/formatters/date_formatter.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.tasks});
  final List<TaskEntity> tasks;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _CustomScrollBehavior(),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final currentTask = tasks[index];
          return TaskCard(
            title: currentTask.title,
            content: currentTask.description,
            time: DateFormatter.toHourMinutes(currentTask.date),

            prefix: CircleAvatar(
              backgroundColor: primaryFocusColor,
              radius: Responsive.getSizeValue(45),
              child: Icon(
                currentTask.category.getIcon(),
                color: secondaryColor,
                size: Responsive.getSizeValue(60),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    final controller = ScrollController();

    return RawScrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      controller: controller,
      trackColor: secondaryFocusColor,
      thickness: 2,
      radius: Radius.circular(20),
      thumbColor: secondaryColor,
      padding: EdgeInsets.only(right: 380, bottom: 20),
      minThumbLength: 80,
      mainAxisMargin: 0,
      child: child,
    );
  }
}
