import 'package:flutter/material.dart';
import 'package:snackautomat_24/frontend/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.settings.name);
          },
          child: const Text('Go to Settings'),
        ),
      ),
    );
  }
}
