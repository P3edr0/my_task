import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:my_task/utils/enums/category.dart';

part 'new_task_store.g.dart';

class NewTaskStore = NewTaskStoreBase with _$NewTaskStore;

abstract class NewTaskStoreBase with Store {
  @observable
  Category? taskCategory;

  final taskNameController = TextEditingController();
  final taskDateController = TextEditingController();
  final taskStartTimeController = TextEditingController();
  final taskEndTimeController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  ///////////////////// GET /////////////////////////

  @action
  void setTaskCategory(Category newCategory) {
    taskCategory = newCategory;
  }
}
