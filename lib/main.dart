import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_task/locale/jack_localizations.dart';
import 'package:my_task/locale/locale_controller.dart';
import 'package:my_task/presenter/home/home_store.dart';
import 'package:my_task/presenter/new_task/new_task_store.dart';
import 'package:my_task/presenter/splash/splash_page.dart';
import 'package:my_task/theme/custom_themes/theme.dart';

GetIt getIt = GetIt.instance;

void main() {
  configureDependencies();

  runApp(Home());
}

class Home extends StatelessWidget {
  Home({super.key});
  final localeController = LocaleController.instance();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: localeController.locale,
      theme: TaskAppTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: JackLocalizations.localizationsDelegates,
      supportedLocales: JackLocalizations.supportedLocales,
      home: const Splash(),
    );
  }
}

void configureDependencies() {
  getIt.registerLazySingleton<NewTaskStore>(() => NewTaskStore());
  getIt.registerLazySingleton<HomeStore>(() => HomeStore());
}
