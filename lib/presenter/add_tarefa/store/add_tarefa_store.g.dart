// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_tarefa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTarefaStore on _AddTarefaBase, Store {
  late final _$listaAtom = Atom(name: '_AddTarefaBase.lista', context: context);

  @override
  String get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(String value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  late final _$claroAtom = Atom(name: '_AddTarefaBase.claro', context: context);

  @override
  bool get claro {
    _$claroAtom.reportRead();
    return super.claro;
  }

  @override
  set claro(bool value) {
    _$claroAtom.reportWrite(value, super.claro, () {
      super.claro = value;
    });
  }

  late final _$corAtom = Atom(name: '_AddTarefaBase.cor', context: context);

  @override
  Color get cor {
    _$corAtom.reportRead();
    return super.cor;
  }

  @override
  set cor(Color value) {
    _$corAtom.reportWrite(value, super.cor, () {
      super.cor = value;
    });
  }

  late final _$idCorAtom = Atom(name: '_AddTarefaBase.idCor', context: context);

  @override
  int get idCor {
    _$idCorAtom.reportRead();
    return super.idCor;
  }

  @override
  set idCor(int value) {
    _$idCorAtom.reportWrite(value, super.idCor, () {
      super.idCor = value;
    });
  }

  late final _$tarefasListAtom = Atom(
    name: '_AddTarefaBase.tarefasList',
    context: context,
  );

  @override
  List<dynamic> get tarefasList {
    _$tarefasListAtom.reportRead();
    return super.tarefasList;
  }

  @override
  set tarefasList(List<dynamic> value) {
    _$tarefasListAtom.reportWrite(value, super.tarefasList, () {
      super.tarefasList = value;
    });
  }

  late final _$deleteAsyncAction = AsyncAction(
    '_AddTarefaBase.delete',
    context: context,
  );

  @override
  Future<void> delete(dynamic index) {
    return _$deleteAsyncAction.run(() => super.delete(index));
  }

  late final _$_AddTarefaBaseActionController = ActionController(
    name: '_AddTarefaBase',
    context: context,
  );

  @override
  dynamic selectCor(Color color) {
    final _$actionInfo = _$_AddTarefaBaseActionController.startAction(
      name: '_AddTarefaBase.selectCor',
    );
    try {
      return super.selectCor(color);
    } finally {
      _$_AddTarefaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectIdCor(dynamic value) {
    final _$actionInfo = _$_AddTarefaBaseActionController.startAction(
      name: '_AddTarefaBase.selectIdCor',
    );
    try {
      return super.selectIdCor(value);
    } finally {
      _$_AddTarefaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color convertColor(int index) {
    final _$actionInfo = _$_AddTarefaBaseActionController.startAction(
      name: '_AddTarefaBase.convertColor',
    );
    try {
      return super.convertColor(index);
    } finally {
      _$_AddTarefaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTarefa() {
    final _$actionInfo = _$_AddTarefaBaseActionController.startAction(
      name: '_AddTarefaBase.addTarefa',
    );
    try {
      return super.addTarefa();
    } finally {
      _$_AddTarefaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getchecks() {
    final _$actionInfo = _$_AddTarefaBaseActionController.startAction(
      name: '_AddTarefaBase.getchecks',
    );
    try {
      return super.getchecks();
    } finally {
      _$_AddTarefaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editaCheck(dynamic index) {
    final _$actionInfo = _$_AddTarefaBaseActionController.startAction(
      name: '_AddTarefaBase.editaCheck',
    );
    try {
      return super.editaCheck(index);
    } finally {
      _$_AddTarefaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista},
claro: ${claro},
cor: ${cor},
idCor: ${idCor},
tarefasList: ${tarefasList}
    ''';
  }
}
