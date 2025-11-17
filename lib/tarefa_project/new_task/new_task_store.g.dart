// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewTaskStore on NewTaskStoreBase, Store {
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
  String toString() {
    return '''
taskCategory: ${taskCategory}
    ''';
  }
}
