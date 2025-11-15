import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'add_tarefa_store.g.dart';

class AddTarefaStore = _AddTarefaBase with _$AddTarefaStore;

abstract class _AddTarefaBase with Store {
  var controller = TextEditingController();

  @observable
  String lista = "";
  @observable
  bool claro = false;
  @observable
  var cor = Colors.white;
  @observable
  int idCor = 09;
  @observable
  List tarefasList = [];
  List<bool> checksList = ObservableList();

  @action
  selectCor(Color color) => cor = color;

  @action
  selectIdCor(value) => idCor = value;

  @action
  Color convertColor(int index) {
    int id = tarefasList[index]["cor"];
    if (id == 1) return Colors.yellow;
    if (id == 2) return Colors.yellow.shade900;
    if (id == 3) return Colors.orange.shade900;
    if (id == 4) return Colors.red;
    if (id == 5) return Colors.red.shade900;
    if (id == 6) return Colors.deepPurple;
    if (id == 7) return Colors.deepPurple.shade900;
    if (id == 8) return Colors.blue.shade800;
    if (id == 9) return Colors.green.shade900;
    if (id == 10) return Colors.green;
    return Colors.white;
  }

  @action
  void addTarefa() {
    Map<String, dynamic> tarefa = {};
    tarefa["titulo"] = controller.text;
    tarefa["ok"] = false;
    tarefa["cor"] = idCor;
    tarefasList.insert(0, tarefa);
    controller.clear();
    cor = Colors.white;
    getchecks();
    log(tarefasList.toString());
  }

  @action
  void getchecks() {
    checksList.clear();
    for (int i = 0; i < tarefasList.length; i++) {
      if (tarefasList[i]["ok"] == true) {
        checksList.add(true);
      } else {
        checksList.add(false);
      }
      print("Checklist Size >> ${checksList.length}");
    }
  }

  @action
  void editaCheck(index) {
    tarefasList[index]["ok"] = !tarefasList[index]["ok"];
    checksList[index] = !checksList[index];
  }

  @action
  Future<void> delete(index) async {
    tarefasList.removeAt(index);
  }
}
