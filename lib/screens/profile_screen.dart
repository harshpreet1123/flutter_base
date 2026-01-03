import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../providers/auth_provider.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/logout_sheet.dart';
import '../services/service_locator.dart';
import '../services/navigation_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final auth = context.read<AuthProvider>();

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
                icon: Ionicons.settings,
                label: t.settings,
                showChevron: true,
                onPress: () {
                   getIt<Navigation>().navigateTo('/settings');
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
