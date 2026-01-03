import 'package:flutter/material.dart';
import '../services/service_locator.dart';
import '../services/storage_service.dart';
import '../constants/storage_keys.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  // Keys
  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final storage = getIt<StorageService>();
    
    // Load Theme
    final savedTheme = storage.getString(StorageKeys.theme);
    if (savedTheme == 'light') _themeMode = ThemeMode.light;
    else if (savedTheme == 'dark') _themeMode = ThemeMode.dark;
    else _themeMode = ThemeMode.system;

    // Load Language
    final savedLang = storage.getString(StorageKeys.language);
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
    
    await getIt<StorageService>().setString(StorageKeys.theme, modeStr);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await getIt<StorageService>().setString(StorageKeys.language, locale.languageCode);
    notifyListeners();
  }
}
