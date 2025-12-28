import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_base/l10n/app_localizations.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.compass_outline, size: 80, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(t.exploreMessage, style: theme.textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
