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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home.name,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
