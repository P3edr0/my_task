import 'package:flutter/material.dart';

class LocaleController with ChangeNotifier {
  LocaleController._();
  factory LocaleController.instance() {
    _instance ??= LocaleController._();

    return _instance!;
  }

  static LocaleController? _instance;

  Locale _locale = const Locale('pt', 'BR');
  final List<String> _languages = ['Português', 'English'];
  List<String> get languages => _languages;
  Locale get locale => _locale;
  String get selectedLanguage => languageTranslate();
  Map<String, dynamic> _data = {};

  Map get data => _data;
  String? translate(String key) => _data[key];

  void setLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }

  void startLocale() {
    _locale = _locale;
    notifyListeners();
  }

  void update() async {
    Future.delayed((Durations.short2), () {
      notifyListeners();
    });
  }

  String languageTranslate() {
    switch (locale.languageCode) {
      case 'en':
        return 'English';

      default:
        return 'Português';
    }
  }

  void setData(Map<String, dynamic> newData) {
    _data = newData;
    notifyListeners();
  }
}
