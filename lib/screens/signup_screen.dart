import 'package:flutter/material.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Ionicons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.createAccount,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  t.signupSubtitle,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 32),
                AppTextField(
                  label: t.fullName,
                  placeholder: t.namePlaceholder,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: t.email,
                  placeholder: t.enterEmail,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: t.password,
                  placeholder: t.createPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                AppButton(
                  text: t.signUp,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       // Implement signup
                    }
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(t.alreadyHaveAccount),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(t.signIn),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
