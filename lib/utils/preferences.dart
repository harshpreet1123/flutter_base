import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String keyTheme = 'settings.theme';
  static const String keyLanguage = 'settings.language';

  static Future<void> saveTheme(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyTheme, themeMode);
  }

  static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyTheme);
  }

  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyLanguage, languageCode);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyLanguage);
  }
}
