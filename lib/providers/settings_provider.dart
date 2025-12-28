import 'package:flutter/material.dart';
import '../utils/preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    // Load Theme
    final savedTheme = await Preferences.getTheme();
    if (savedTheme == 'light') _themeMode = ThemeMode.light;
    else if (savedTheme == 'dark') _themeMode = ThemeMode.dark;
    else _themeMode = ThemeMode.system;

    // Load Language
    final savedLang = await Preferences.getLanguage();
    if (savedLang != null) {
      _locale = Locale(savedLang);
    }
    
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    String modeStr = 'system';
    if (mode == ThemeMode.light) modeStr = 'light';
    if (mode == ThemeMode.dark) modeStr = 'dark';
    
    await Preferences.saveTheme(modeStr);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await Preferences.saveLanguage(locale.languageCode);
    notifyListeners();
  }
}
