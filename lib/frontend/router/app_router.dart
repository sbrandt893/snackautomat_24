import 'package:flutter/material.dart';
import 'package:snackautomat_24/frontend/screens/home_screen.dart';
import 'package:snackautomat_24/frontend/screens/settings_screen.dart';

enum Routes {
  home,
  settings,
}

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
