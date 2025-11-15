import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_task/tarefa_project/add_tarefa/add_tarefa_functions.dart';
import 'package:my_task/tarefa_project/add_tarefa/add_tarefa_widgets.dart';
import 'package:my_task/tarefa_project/add_tarefa/store/add_tarefa_store.dart';
import 'package:my_task/tarefa_project/home/home_old_widgets.dart';

class HomeOldPage extends StatefulWidget {
  const HomeOldPage({super.key});
  @override
  State<HomeOldPage> createState() => _HomePage();
}

class _HomePage extends State<HomeOldPage> {
  final addTarefaStore = AddTarefaStore();

  @override
  void initState() {
    super.initState();
    initialReadFile();
  }

  Future<void> initialReadFile() async {
    addTarefaStore.tarefasList = json.decode(
      await AddTarefaFunctions(context).lerArquivo(),
    );
    addTarefaStore.getchecks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  AddTarefaWidget(context, addTarefaStore).widgetPrincipal(),
                  HomeWidgets(context).tarefas(addTarefaStore),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 50,
                    width: double.infinity,
                    color: Colors.black,
                    child: Text(
                      "\" Sonhos sem diciplina o levarão a uma vida de frustração! \" ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
