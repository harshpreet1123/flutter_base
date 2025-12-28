import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_base/l10n/app_localizations.dart';

class LanguageSheet extends StatelessWidget {
  final List<Map<String, String>> languages;
  final String currentLanguage;
  final Function(String) onLanguageChange;

  const LanguageSheet({
    super.key,
    required this.languages,
    required this.currentLanguage,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              t.selectLanguage,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: languages.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final lang = languages[index];
                final isSelected = lang['code'] == currentLanguage;
                
                return ListTile(
                  title: Text(lang['label']!),
                  trailing: isSelected 
                    ? Icon(Ionicons.checkmark, color: Theme.of(context).colorScheme.primary) 
                    : null,
                  onTap: () {
                    Navigator.pop(context);
                    onLanguageChange(lang['code']!);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
