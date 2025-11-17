// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$selectedDayAtom = Atom(
    name: 'HomeStoreBase.selectedDay',
    context: context,
  );

  @override
  DateTime? get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime? value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  late final _$daysAtom = Atom(name: 'HomeStoreBase.days', context: context);

  @override
  List<DateTime> get days {
    _$daysAtom.reportRead();
    return super.days;
  }

  @override
  set days(List<DateTime> value) {
    _$daysAtom.reportWrite(value, super.days, () {
      super.days = value;
    });
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  String getDayLetter(DateTime date) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.getDayLetter',
    );
    try {
      return super.getDayLetter(date);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDay(DateTime newSelectedDay) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setSelectedDay',
    );
    try {
      return super.setSelectedDay(newSelectedDay);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDay: ${selectedDay},
days: ${days}
    ''';
  }
}
