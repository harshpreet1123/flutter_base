import 'package:flutter/material.dart';
import 'package:flutter_base/l10n/app_localizations.dart';

class LogoutSheet extends StatelessWidget {
  final VoidCallback onLogout;
  final String title;

  const LogoutSheet({super.key, required this.onLogout, required this.title});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            t.logoutMessage,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.cancel),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context); // Close sheet
                    onLogout();
                  },
                  child: Text(t.logout),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
        ],
      ),
    );
  }
}
