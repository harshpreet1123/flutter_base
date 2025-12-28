import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_base/l10n/app_localizations.dart';
import '../screens/home_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/activity_screen.dart';
import '../screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/home';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Ionicons.home_outline),
            selectedIcon: const Icon(Ionicons.home),
            label: t.home,
          ),
          NavigationDestination(
            icon: const Icon(Ionicons.compass_outline),
            selectedIcon: const Icon(Ionicons.compass),
            label: t.explore,
          ),
          NavigationDestination(
            icon: const Icon(Ionicons.notifications_outline),
            selectedIcon: const Icon(Ionicons.notifications),
            label: t.activity,
          ),
          NavigationDestination(
            icon: const Icon(Ionicons.person_outline),
            selectedIcon: const Icon(Ionicons.person),
            label: t.profile,
          ),
        ],
      ),
    );
  }
}
