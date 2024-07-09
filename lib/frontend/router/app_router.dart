import 'package:flutter/material.dart';
import 'package:snackautomat_24/frontend/screens/game/game_screen.dart';
import 'package:snackautomat_24/frontend/screens/home/home_screen.dart';
import 'package:snackautomat_24/frontend/screens/settings/settings_screen.dart';

enum Routes {
  home,
  settings,
  game,
  newVendingMachineFront,
}

class AppRouter {
  // create routes with transition animation
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case 'game':
        return FadeOutRoute(page: const GameScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}

class FadeOutRoute extends PageRouteBuilder {
  final Widget page;

  FadeOutRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation),
            child: child,
          ),
        );
}
