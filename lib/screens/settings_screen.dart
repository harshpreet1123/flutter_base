import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../providers/settings_provider.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/language_sheet.dart';
import '../services/service_locator.dart';
import '../services/navigation_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final settings = context.watch<SettingsProvider>();

    final languages = const [
      {'code': 'en', 'label': 'English'},
      {'code': 'es', 'label': 'Español'},
      {'code': 'ar', 'label': 'العربية'},
    ];

    final currentLangLabel = languages.firstWhere(
      (l) => l['code'] == settings.locale.languageCode,
      orElse: () => {'label': 'English'},
    )['label'];

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings),
        leading: IconButton(
          icon: const Icon(Ionicons.arrow_back),
          onPressed: () => getIt<Navigation>().goBack(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dark Mode
          ProfileMenuItem(
            icon: Ionicons.moon, 
            label: t.darkMode,
            showChevron: false,
            trailing: Switch(
              value: settings.themeMode == ThemeMode.dark,
              onChanged: (val) {
                settings.setThemeMode(val ? ThemeMode.dark : ThemeMode.light);
              },
            ),
            onPress: () {},
          ),

          // Language
          ProfileMenuItem(
            icon: Ionicons.globe,
            label: t.language,
            value: currentLangLabel,
            onPress: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) => LanguageSheet(
                  languages: languages,
                  currentLanguage: settings.locale.languageCode,
                  onLanguageChange: (code) {
                    settings.setLocale(Locale(code));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
