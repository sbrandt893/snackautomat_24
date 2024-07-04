import 'package:flutter/material.dart';
import 'package:snackautomat_24/frontend/screens/game_screen.dart';
import 'package:snackautomat_24/frontend/screens/home_screen.dart';
import 'package:snackautomat_24/frontend/screens/settings_screen.dart';

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
        return MaterialPageRoute(builder: (_) => const GameScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}

class SlideFromTopRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromTopRoute({required this.page})
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
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
