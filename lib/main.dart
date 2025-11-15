import 'package:flutter/material.dart';
import 'package:my_task/tarefa_project/add_tarefa/store/add_tarefa_store.dart';
import 'package:my_task/tarefa_project/splash/splash_page.dart';
import 'package:my_task/theme/custom_themes/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<AddTarefaStore>(create: (_) => AddTarefaStore())],
      child: MaterialApp(
        theme: TaskAppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Tarefas de Hoje',
        home: const Splash(),
      ),
    );
  }
}
