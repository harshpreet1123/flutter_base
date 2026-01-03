import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import 'services/service_locator.dart';
import 'services/navigation_service.dart';

import 'providers/auth_provider.dart';
import 'providers/settings_provider.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/main_screen.dart';
import 'screens/settings_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final auth = context.watch<AuthProvider>();

    return MaterialApp(
      title: 'Flutter Ease',
      debugShowCheckedModeBanner: false,
      
      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      
      navigatorKey: getIt<Navigation>().navigatorKey,

      // Localization
      locale: settings.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('ar'),
      ],

      // Navigation
      home: auth.isLoading
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : (auth.isAuthenticated ? const MainScreen() : const LoginScreen()),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const MainScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
