import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class JackLocalizations {
  static List<LocalizationsDelegate> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('pt', 'BR'),
  ];
}
