import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:my_task/domain/entities/task_entity.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/tarefa_project/home/components/day_card.dart';
import 'package:my_task/tarefa_project/home/components/home_card.dart';
import 'package:my_task/tarefa_project/home/components/menu_icon.dart';
import 'package:my_task/tarefa_project/home/components/task_list_view.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/utils/enums/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: Responsive.getSizeValue(26)),
          Stack(
            children: [
              ClipPath(
                clipper: TaskHomeCard(avatarRadius: 30, borderRadius: 40),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(color: secondaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Responsive.getSizeValue(40)),

                      Row(
                        children: [
                          TaskMenuIcon(),
                          SizedBox(width: 16),
                          Icon(
                            FeatherIcons.bell,
                            color: primaryColor,
                            size: Responsive.getSizeValue(28),
                          ),
                        ],
                      ),
                      SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Minha Tarefa", style: TaskFontStyle.h3Bold),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.add,
                              color: secondaryColor,
                              size: Responsive.getSizeValue(30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Responsive.getSizeValue(8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hoje", style: TaskFontStyle.h4Bold),
                          Text(
                            "Segunda, 10 janeiro",
                            style: TaskFontStyle.body.copyWith(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Responsive.getSizeValue(24)),
                      SizedBox(
                        height: Responsive.getSizeValue(70),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder:
                              (context, index) => TaskDayCard(
                                day: "0${index + 1}",
                                dayLetter: "S",
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 5,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: secondaryFocusColor,
                  radius: 30,
                ),
              ),
            ],
          ),

          Expanded(
            child: SizedBox(
              width: Responsive.getSizeValue(350),
              child: TaskListView(
                tasks: [
                  TaskEntity(
                    title: 'Ligar para Crish',
                    description: 'Falar sobre a contratação de novo dev',
                    category: Category.work,
                    date: DateTime.now().toLocal(),
                    hasCompleted: false,
                  ),
                  TaskEntity(
                    title: 'Falar com Jon',
                    description: 'Falar sobre a contratação de novo dev',
                    category: Category.family,
                    date: DateTime.now().toLocal(),
                    hasCompleted: false,
                  ),
                  TaskEntity(
                    title: 'Depositar bônus joão',
                    description: '5500 referente a dezembro',
                    category: Category.finance,
                    date: DateTime.now().toLocal(),
                    hasCompleted: false,
                  ),
                  TaskEntity(
                    title: 'Parabenizar Viny',
                    description: 'Parabenizar pelos 35 anos de casada',
                    category: Category.family,
                    date: DateTime.now().toLocal(),
                    hasCompleted: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
