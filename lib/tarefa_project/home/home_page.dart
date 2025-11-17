import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_task/domain/entities/task_entity.dart';
import 'package:my_task/main.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/tarefa_project/home/components/day_card.dart';
import 'package:my_task/tarefa_project/home/components/home_card.dart';
import 'package:my_task/tarefa_project/home/components/menu_icon.dart';
import 'package:my_task/tarefa_project/home/components/task_list_view.dart';
import 'package:my_task/tarefa_project/home/home_store.dart';
import 'package:my_task/tarefa_project/new_task/new_task_page.dart';
import 'package:my_task/tarefa_project/new_task/new_task_store.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/utils/enums/category.dart';
import 'package:my_task/utils/formatters/date_formatter.dart';
import 'package:my_task/utils/formatters/int_formatter.dart';
import 'package:my_task/utils/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = getIt<HomeStore>();
  final newTaskStore = getIt<NewTaskStore>();
  final today = DateTime.now().toLocal().normalize();

  @override
  void initState() {
    super.initState();
    startDays();
  }

  startDays() {
    DateTime initialDate = DateTime(today.year, today.month - 1).normalize();
    final endDate = DateTime(today.year, today.month + 1).normalize();
    while (initialDate.isBefore(endDate)) {
      store.days.add(initialDate);
      initialDate = initialDate.add(Duration(days: 1));
    }
    store.setSelectedDay(today);
  }

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
                  width: double.infinity,
                  height: Responsive.getSizeValue(400),
                  decoration: BoxDecoration(color: secondaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Responsive.getSizeValue(56)),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TaskMenuIcon(),
                                SizedBox(width: 16),
                                Icon(
                                  TaskIcons.notification,
                                  color: primaryColor,
                                  size: Responsive.getSizeValue(28),
                                ),
                              ],
                            ),

                            SizedBox(height: 48),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Minha Tarefa",
                                  style: TaskFontStyle.h3Bold,
                                ),
                                InkWell(
                                  onTap: () {
                                    final selectedDate = store.selectedDay;
                                    newTaskStore
                                        .taskDateController
                                        .text = DateFormatter.toDayMonthYear(
                                      selectedDate!,
                                    );
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder:
                                            (BuildContext context) =>
                                                NewTaskPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                ),
                              ],
                            ),
                            SizedBox(height: Responsive.getSizeValue(8)),
                            Observer(
                              builder: (context) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Hoje", style: TaskFontStyle.h4Bold),
                                    Text(
                                      DateFormatter().dateResume(
                                        store.selectedDay!,
                                      ),
                                      style: TaskFontStyle.body.copyWith(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Responsive.getSizeValue(70),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: store.days.length,
                          itemBuilder: (context, index) {
                            return Observer(
                              builder: (context) {
                                final currentDay = store.days[index];
                                final isFirst = index == 0;
                                final isLast = index == 5;
                                final selectedDay = store.selectedDay;
                                final isSelected = currentDay.isAtSameMomentAs(
                                  selectedDay ?? today,
                                );
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: isFirst ? 24 : 0,
                                    right: isLast ? 24 : 16,
                                  ),

                                  child: TaskDayCard(
                                    day: IntFormatter.toShow(currentDay.day),
                                    dayLetter: store.getDayLetter(currentDay),
                                    isSelected: isSelected,
                                    onTap:
                                        () => store.setSelectedDay(currentDay),
                                  ),
                                );
                              },
                            );
                          },
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
