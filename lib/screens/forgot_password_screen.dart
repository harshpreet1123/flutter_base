import 'package:flutter/material.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_base/services/service_locator.dart';
import 'package:flutter_base/services/navigation_service.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.emailSentMessage)),
      );
      getIt<Navigation>().goBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Ionicons.arrow_back),
          onPressed: () => getIt<Navigation>().goBack(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.forgotPassword,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t.emailSentMessage, 
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(
                label: t.email,
                placeholder: t.enterEmail,
                controller: _emailController,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: t.sendInstructions,
                onPressed: _handleSubmit,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
