// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewTaskStore on NewTaskStoreBase, Store {
  Computed<String>? _$timeInvalidMessageComputed;

  @override
  String get timeInvalidMessage =>
      (_$timeInvalidMessageComputed ??= Computed<String>(
            () => super.timeInvalidMessage,
            name: 'NewTaskStoreBase.timeInvalidMessage',
          ))
          .value;
  Computed<String>? _$categoryInvalidMessageComputed;

  @override
  String get categoryInvalidMessage =>
      (_$categoryInvalidMessageComputed ??= Computed<String>(
            () => super.categoryInvalidMessage,
            name: 'NewTaskStoreBase.categoryInvalidMessage',
          ))
          .value;

  late final _$taskCategoryAtom = Atom(
    name: 'NewTaskStoreBase.taskCategory',
    context: context,
  );

  @override
  Category? get taskCategory {
    _$taskCategoryAtom.reportRead();
    return super.taskCategory;
  }

  @override
  set taskCategory(Category? value) {
    _$taskCategoryAtom.reportWrite(value, super.taskCategory, () {
      super.taskCategory = value;
    });
  }

  late final _$isValidatingAtom = Atom(
    name: 'NewTaskStoreBase.isValidating',
    context: context,
  );

  @override
  bool get isValidating {
    _$isValidatingAtom.reportRead();
    return super.isValidating;
  }

  @override
  set isValidating(bool value) {
    _$isValidatingAtom.reportWrite(value, super.isValidating, () {
      super.isValidating = value;
    });
  }

  late final _$taskStartTimeAtom = Atom(
    name: 'NewTaskStoreBase.taskStartTime',
    context: context,
  );

  @override
  String get taskStartTime {
    _$taskStartTimeAtom.reportRead();
    return super.taskStartTime;
  }

  @override
  set taskStartTime(String value) {
    _$taskStartTimeAtom.reportWrite(value, super.taskStartTime, () {
      super.taskStartTime = value;
    });
  }

  late final _$taskEndTimeAtom = Atom(
    name: 'NewTaskStoreBase.taskEndTime',
    context: context,
  );

  @override
  String get taskEndTime {
    _$taskEndTimeAtom.reportRead();
    return super.taskEndTime;
  }

  @override
  set taskEndTime(String value) {
    _$taskEndTimeAtom.reportWrite(value, super.taskEndTime, () {
      super.taskEndTime = value;
    });
  }

  late final _$NewTaskStoreBaseActionController = ActionController(
    name: 'NewTaskStoreBase',
    context: context,
  );

  @override
  void setTaskCategory(Category newCategory) {
    final _$actionInfo = _$NewTaskStoreBaseActionController.startAction(
      name: 'NewTaskStoreBase.setTaskCategory',
    );
    try {
      return super.setTaskCategory(newCategory);
    } finally {
      _$NewTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartTime(String newStartTime) {
    final _$actionInfo = _$NewTaskStoreBaseActionController.startAction(
      name: 'NewTaskStoreBase.setStartTime',
    );
    try {
      return super.setStartTime(newStartTime);
    } finally {
      _$NewTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndTime(String newEndTime) {
    final _$actionInfo = _$NewTaskStoreBaseActionController.startAction(
      name: 'NewTaskStoreBase.setEndTime',
    );
    try {
      return super.setEndTime(newEndTime);
    } finally {
      _$NewTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFields() {
    final _$actionInfo = _$NewTaskStoreBaseActionController.startAction(
      name: 'NewTaskStoreBase.clearFields',
    );
    try {
      return super.clearFields();
    } finally {
      _$NewTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TaskEntity? createTask() {
    final _$actionInfo = _$NewTaskStoreBaseActionController.startAction(
      name: 'NewTaskStoreBase.createTask',
    );
    try {
      return super.createTask();
    } finally {
      _$NewTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskCategory: ${taskCategory},
isValidating: ${isValidating},
taskStartTime: ${taskStartTime},
taskEndTime: ${taskEndTime},
timeInvalidMessage: ${timeInvalidMessage},
categoryInvalidMessage: ${categoryInvalidMessage}
    ''';
  }
}
