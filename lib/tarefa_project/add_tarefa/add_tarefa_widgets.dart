import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_task/globals/globals_vars.dart';
import 'package:my_task/tarefa_project/add_tarefa/add_tarefa_functions.dart';
import 'package:my_task/tarefa_project/add_tarefa/store/add_tarefa_store.dart';
import 'package:my_task/utils/assets.dart';

class AddTarefaWidget {
  final BuildContext context;
  final AddTarefaStore addTarefaStore;

  AddTarefaWidget(this.context, this.addTarefaStore);

  Widget widgetPrincipal() {
    return SizedBox(height: 300, child: Column(children: [appBar(), body()]));
  }

  body() {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audio = AudioCache(prefix: "dev_assets/");

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black,
      ),
      // height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Nome da Missão",
            style: TextStyle(
              color: corFontePrimaria,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Observer(
            builder:
                (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: addTarefaStore.cor,
                        ),
                        controller: addTarefaStore.controller,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 50,
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: addTarefaStore.cor,
                          size: 30,
                        ),
                      ),
                      onTap: () async {
                        addTarefaStore.addTarefa();

                        await audioPlayer.play(
                          AssetSource(Assets.addTaskSound),
                        );

                        String writeResponse = await AddTarefaFunctions(
                          context,
                        ).escreverArquivo(addTarefaStore);

                        String readResponse =
                            await AddTarefaFunctions(context).lerArquivo();
                        log(writeResponse, name: "Write Response");
                        log(readResponse, name: "Read Response");
                      },
                    ),
                  ],
                ),
          ),
          const SizedBox(height: 10),
          Text(
            "Selecione a cor do traje",
            style: TextStyle(
              color: corFontePrimaria,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Builder(
              builder: (context) {
                return Observer(
                  builder: (_) {
                    return addTarefaStore.cor == Colors.white
                        ? SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector01,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector01);
                                  addTarefaStore.selectIdCor(1);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector02,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector02);
                                  addTarefaStore.selectIdCor(2);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector03,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector03);
                                  addTarefaStore.selectIdCor(3);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector04,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector04);
                                  addTarefaStore.selectIdCor(4);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector05,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector05);
                                  addTarefaStore.selectIdCor(5);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector06,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector06);
                                  addTarefaStore.selectIdCor(6);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector07,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector07);
                                  addTarefaStore.selectIdCor(7);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector08,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector08);
                                  addTarefaStore.selectIdCor(8);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector09,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector09);
                                  addTarefaStore.selectIdCor(9);
                                },
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.palette,
                                  color: corselector10,
                                  size: 30,
                                ),
                                onTap: () {
                                  addTarefaStore.selectCor(corselector10);
                                  addTarefaStore.selectIdCor(10);
                                },
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        )
                        : GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.userAstronaut,
                            color: addTarefaStore.cor,
                            size: 40,
                          ),
                          onTap: () {
                            addTarefaStore.selectCor(Colors.white);
                            addTarefaStore.selectIdCor(0);
                          },
                        );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  appBar() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 70,
      color: corFundoApp,
      child: Observer(
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.rocket, color: addTarefaStore.cor),
              const SizedBox(width: 20),
              Text(
                "MISSÕES DE HOJE",
                style: TextStyle(
                  color: addTarefaStore.cor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
