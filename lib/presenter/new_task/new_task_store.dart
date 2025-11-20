import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:my_task/domain/entities/task_entity.dart';
import 'package:my_task/utils/enums/category.dart';
import 'package:my_task/utils/formatters/date_formatter.dart';

part 'new_task_store.g.dart';

class NewTaskStore = NewTaskStoreBase with _$NewTaskStore;

abstract class NewTaskStoreBase with Store {
  @observable
  Category? taskCategory;
  @observable
  bool isValidating = false;

  @observable
  String taskStartTime = '';
  @observable
  String taskEndTime = '';
  final taskDescriptionController = TextEditingController();
  final taskNameController = TextEditingController();
  final taskDateController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  ///////////////////// GET /////////////////////////
  @computed
  String get timeInvalidMessage =>
      (isValidating && (taskStartTime.isEmpty || taskEndTime.isEmpty))
          ? 'Insira um horário válido'
          : '';

  @computed
  String get categoryInvalidMessage =>
      (isValidating && taskCategory == null) ? 'Selecione uma categoria' : '';

  @action
  void setTaskCategory(Category newCategory) {
    taskCategory = newCategory;
  }

  @action
  void setStartTime(String newStartTime) {
    taskStartTime = newStartTime;
  }

  @action
  void setEndTime(String newEndTime) {
    taskEndTime = newEndTime;
  }

  @action
  void clearFields() {
    isValidating = false;
    taskNameController.clear();
    taskDescriptionController.clear();

    taskCategory = null;
    taskEndTime = '';
    taskStartTime = '';
  }

  @action
  TaskEntity? createTask() {
    isValidating = true;

    if (timeInvalidMessage.isNotEmpty || categoryInvalidMessage.isNotEmpty) {
      return null;
    }
    if (key.currentState?.validate() ?? false) {
      final date = DateFormatter.dateValidator(taskDateController.text);
      final taskName = taskNameController.text;
      final description = taskDescriptionController.text;

      final newTask = TaskEntity(
        category: taskCategory!,
        date: date!,
        description: description,
        hasCompleted: false,
        title: taskName,
      );
      clearFields();

      return newTask;
    } else {
      return null;
    }
  }
}
