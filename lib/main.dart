import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/frontend/router/app_router.dart';

void main() {
  runApp(ProviderScope(
    child: MainApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;

  const MainApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/backgrounds/uptown.jpg'), context);
    precacheImage(const AssetImage('assets/images/backgrounds/uptown2.jpg'), context);
    precacheImage(const AssetImage('assets/images/backgrounds/vending_machine_comic.png'), context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home.name,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
