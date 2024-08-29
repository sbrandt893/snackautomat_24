import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/app_settings.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/synced_scroll_widgets.dart';
import 'package:snackautomat_24/frontend/widgets/custom_scaffold.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    AppSettings appSettings = ref.watch(appSettingsProvider);
    return const CustomScaffold(
      appbarTitle: 'Settings',
      body: Text('Settings'),

      // SyncedScrollWidgets(),

      // Center(
      //     child: ElevatedButton(
      //         onPressed: () {
      //           ref.read(appSettingsProvider.notifier).changeTranslation();
      //         },
      //         child: Text(appSettings.translation.settingsScreenTitle))));

      // Scaffold(
      //   appBar: AppBar(
      //     title: Text(appSettings.translation.settingsScreenTitle),
      //     backgroundColor: Colors.amber,
      //   ),
      //   body: GestureDetector(
      //     onVerticalDragEnd: (details) {
      //       if (details.primaryVelocity! < 0) {
      //         Navigator.pop(context);
      //       }
      //     },
      //     child: Container(
      //       color: Colors.transparent,
      //       height: MediaQuery.of(context).size.height,
      //       width: MediaQuery.of(context).size.width,
      //       child: Center(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             ref.read(appSettingsProvider.notifier).changeTranslation();
      //           },
      //           child: const Text('Change Language'),
      //         ),
      //       ),
      //     ),
      //   ),
      // );
      // }
    );
  }
}
