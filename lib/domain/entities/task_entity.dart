import 'package:my_task/utils/enums/category.dart';

class TaskEntity {
  TaskEntity({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.hasCompleted,
  });
  String title;
  String description;
  Category category;
  DateTime date;
  bool hasCompleted;
}
