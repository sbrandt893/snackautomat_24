import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/app_settings.dart';
import 'package:snackautomat_24/logic/provider/provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    AppSettings appSettings = ref.watch(appSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(appSettings.translation.settingsScreenTitle),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(appSettingsProvider.notifier).changeTranslation();
          },
          child: const Text('Change Language'),
        ),
      ),
    );
  }
}
