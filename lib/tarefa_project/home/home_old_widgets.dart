import 'dart:convert';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_task/globals/globals_vars.dart';
import 'package:my_task/tarefa_project/add_tarefa/add_tarefa_functions.dart';
import 'package:my_task/tarefa_project/add_tarefa/store/add_tarefa_store.dart';

class HomeWidgets {
  BuildContext context;
  HomeWidgets(this.context);
  // final addTarefaStore = AddTarefaStore();

  Widget widgetPrincipal() {
    return Container();

    // tarefas();
  }

  appBar() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 70,
      color: corFundoApp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_add, color: corFontePrimaria),
          const SizedBox(width: 20),
          Text(
            "Tarefas de Hoje",
            style: TextStyle(color: corFontePrimaria, fontSize: 20),
          ),
        ],
      ),
    );
  }

  // body() {
  //   return GestureDetector(
  //     child: Container(
  //       color: corFundoSecundaria,
  //       margin: const EdgeInsets.only(top: 20),
  //       padding: const EdgeInsets.all(10),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(FontAwesomeIcons.plus, color: corFonteSecundaria),
  //           const SizedBox(width: 20),
  //           Text(
  //             "Adicionar Tarefa",
  //             style: TextStyle(
  //               color: corFonteSecundaria,
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  tarefas(AddTarefaStore addTarefaStore) {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audio = AudioCache(prefix: "dev_assets/");
    return Expanded(
      child: Observer(
        builder: (_) {
          log(addTarefaStore.tarefasList.toString(), name: "Lista chegou");
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            padding: const EdgeInsets.all(8),
            itemCount: addTarefaStore.tarefasList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade800,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(bottom: 5),
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        "Eliminar Tarefa",
                        style: TextStyle(
                          color: corFontePrimaria,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.shuttleSpace,
                        color: corFontePrimaria,
                      ),
                    ],
                  ),
                ),
                key: UniqueKey(), //ValueKey<int>(index),
                onDismissed: (DismissDirection direction) async {
                  addTarefaStore.delete(index);
                  await AddTarefaFunctions(
                    context,
                  ).escreverArquivo(addTarefaStore);

                  addTarefaStore.tarefasList = json.decode(
                    await AddTarefaFunctions(context).lerArquivo(),
                  );
                  addTarefaStore.getchecks();
                },
                child: GestureDetector(
                  child: Observer(
                    builder: (_) {
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              addTarefaStore.checksList[index] == true
                                  ? corselector10
                                  : corFonteSecundaria,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(3, 4),
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(right: 4, bottom: 2),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color:
                                addTarefaStore.tarefasList[index]["ok"]
                                    ? corFonteSecundaria
                                    : addTarefaStore.convertColor(index),
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ListTile(
                                  title: Text(
                                    addTarefaStore.tarefasList[index]["titulo"],
                                    style: TextStyle(
                                      decoration:
                                          addTarefaStore
                                                  .tarefasList[index]["ok"]
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                      decorationStyle:
                                          TextDecorationStyle.double,
                                      color:
                                          addTarefaStore
                                                  .tarefasList[index]["ok"]
                                              ? corselector10
                                              : corFontePrimaria,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              addTarefaStore.tarefasList[index]["ok"]
                                  ? Icon(
                                    FontAwesomeIcons.rocket,
                                    size: 30,
                                    color: corselector10,
                                  )
                                  : Icon(
                                    FontAwesomeIcons.meteor,
                                    size: 30,
                                    color: corFontePrimaria,
                                  ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  onTap: () async {
                    // print("Index Clicado = $index");
                    addTarefaStore.editaCheck(index);
                    await AddTarefaFunctions(
                      context,
                    ).escreverArquivo(addTarefaStore);

                    await AddTarefaFunctions(context).lerArquivo();
                    String confirmAudioPath = "finish_sound.mp3";
                    await audio.load(confirmAudioPath);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
