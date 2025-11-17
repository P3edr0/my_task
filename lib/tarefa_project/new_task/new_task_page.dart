import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_task/main.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/tarefa_project/home/components/menu_icon.dart';
import 'package:my_task/tarefa_project/new_task/components/button.dart';
import 'package:my_task/tarefa_project/new_task/components/category_selector.dart';
import 'package:my_task/tarefa_project/new_task/components/icon_button.dart';
import 'package:my_task/tarefa_project/new_task/components/new_task_textfield.dart';
import 'package:my_task/tarefa_project/new_task/components/new_task_time_selector.dart';
import 'package:my_task/tarefa_project/new_task/new_task_store.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/utils/enums/category.dart';
import 'package:my_task/utils/formatters/int_formatter.dart';
import 'package:my_task/utils/icons.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<NewTaskStore>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Responsive.getSizeValue(26)),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.getSizeValue(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskIconButton(
                        onTap: () => Navigator.pop(context),
                        icon: TaskIcons.back,
                      ),
                      SizedBox(width: Responsive.getSizeValue(16)),

                      TaskMenuIcon(),
                    ],
                  ),
                  SizedBox(height: Responsive.getSizeValue(20)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nova Tarefa", style: TaskFontStyle.h4LargeBold),
                      Icon(
                        FeatherIcons.fileMinus,
                        color: primaryFocusColor,
                        size: Responsive.getSizeValue(32),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.getSizeValue(24)),

                  NewTaskTextField(
                    title: 'Nome da Tarefa',
                    hint: 'Visitar João',

                    controller: store.taskNameController,
                  ),
                  SizedBox(height: Responsive.getSizeValue(32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selecione a Categoria",
                        style: TaskFontStyle.title.copyWith(
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "ver todos",
                        style: TaskFontStyle.small.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Responsive.getSizeValue(10)),
                ],
              ),
            ),
            SizedBox(
              height: Responsive.getSizeValue(32),
              child: ListView.builder(
                itemCount: Category.values.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Observer(
                    builder: (context) {
                      final category = Category.values[index];
                      final isSelected = store.taskCategory == category;
                      final bool isFirst = index == 0;
                      return TaskCategorySelector(
                        isSelected: isSelected,
                        isFirst: isFirst,
                        category: category,
                        onTap: store.setTaskCategory,
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.getSizeValue(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Responsive.getSizeValue(32)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Responsive.getSizeValue(220),
                        child: NewTaskTextField(
                          title: 'Data',
                          hint: '10/02/2025',
                          controller: store.taskDateController,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: primaryFocusColor,
                        child: TaskIconButton(
                          onTap: () async {
                            {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now().toLocal(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              ).then((dt) {
                                if (dt != null) {
                                  final day = IntFormatter.toShow(dt.day);
                                  final month = IntFormatter.toShow(dt.month);
                                  final year = dt.year;
                                  store.taskDateController.text =
                                      '$day/$month/$year';
                                }
                              });
                            }
                          },
                          icon: TaskIcons.calendar,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.getSizeValue(32)),

                  Row(
                    children: [
                      Expanded(
                        child: NewTaskTimeSelector(
                          title: 'Início',
                          label: '10:00 AM',
                          controller: store.taskStartTimeController,
                        ),
                      ),
                      SizedBox(width: Responsive.getSizeValue(20)),
                      Expanded(
                        child: NewTaskTimeSelector(
                          title: 'Encerramento',
                          label: '11:00 AM',

                          controller: store.taskEndTimeController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.getSizeValue(32)),
                  NewTaskTextField(
                    title: 'Descrição',
                    hint: 'Fazer visita pela manhã, com Luisa.',

                    controller: store.taskDescriptionController,
                    isSmall: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: Responsive.getSizeValue(40)),
            TaskButton(title: 'Criar Tarefa', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
