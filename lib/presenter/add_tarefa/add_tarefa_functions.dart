import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:my_task/presenter/add_tarefa/store/add_tarefa_store.dart';
import 'package:path_provider/path_provider.dart';

class AddTarefaFunctions {
  BuildContext context;
  AddTarefaFunctions(this.context);

  Future<File> get _getFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<String> lerArquivo() async {
    try {
      final file = await _getFile;
      log("FILE = $file");
      var lido = await file.readAsString();
      print("Lido >> $lido");
      return lido;
    } catch (e) {
      return "Erro ao escrever no arquivo $e";
    }
  }

  Future<String> escreverArquivo(AddTarefaStore addTarefaStore) async {
    // final addTarefaStore = Provider.of<AddTarefaStore>(context, listen: false);
    String data = json.encode(addTarefaStore.tarefasList);
    log(addTarefaStore.tarefasList.toString(), name: "Lista chegou!");

    try {
      final file = await _getFile;
      await file.writeAsString(data);
      await lerArquivo();
      log("Sucesso ao escrever em arquivo Data >>> $data");
      return "Sucesso";
    } catch (_, stack) {
      log("Erro ao escrever em arquivo");
      log(stack.toString());
      return "falhou";
    }
  }
}
