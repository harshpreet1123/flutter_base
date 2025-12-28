import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../providers/auth_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/language_sheet.dart';
import '../widgets/logout_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final languages = const [
    {'code': 'en', 'label': 'English'},
    {'code': 'es', 'label': 'Español'},
    {'code': 'de', 'label': 'Deutsch'},
    {'code': 'hi', 'label': 'हिन्दी'},
    {'code': 'pa', 'label': 'ਪੰਜਾਬੀ'},
    {'code': 'ja', 'label': '日本語'},
    {'code': 'ko', 'label': '한국어'},
    {'code': 'ar', 'label': 'العربية'},
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final settings = context.watch<SettingsProvider>();
    final auth = context.read<AuthProvider>();

    final currentLangLabel = languages.firstWhere(
      (l) => l['code'] == settings.locale.languageCode,
      orElse: () => {'label': 'English'},
    )['label'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "JD",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "John Doe",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "john.doe@example.com",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 32),
              
              // Settings Section
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

              ProfileMenuItem(
                icon: Ionicons.settings,
                label: t.settings,
                onPress: () {
                  // Navigate to settings details if any
                },
              ),

              ProfileMenuItem(
                icon: Ionicons.log_out,
                label: t.logout,
                onPress: () {
                   showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => LogoutSheet(
                      title: t.logout,
                      onLogout: () {
                        auth.logout();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
