import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SyncedScrollControllers extends StateNotifier<List<ScrollController>> {
  SyncedScrollControllers()
      : super([
          ScrollController(debugLabel: '0'),
          ScrollController(debugLabel: '1'),
          ScrollController(debugLabel: '2'),
        ]) {
    // Füge Listener hinzu, um die Scrolls zu synchronisieren
    for (var controller in state) {
      controller.addListener(() {
        _syncScrolls(debugLabel: controller.debugLabel);
      });
    }
  }

  // Synchronisiere alle ScrollController auf die Position des aufrufenden Controllers
  void _syncScrolls({required String? debugLabel}) {
    final offset = state.firstWhere((c) => c.debugLabel == debugLabel).offset;

    for (var controller in state) {
      if (controller.hasClients && controller.offset != offset) {
        controller.jumpTo(offset);
      }
    }
  }

  // Dispose-Methode ist leer, um Controller aktiv zu lassen
  @override
  void dispose() {
    // Keine manuelle Disposen der Controller
    super.dispose();
  }
}

// Entferne autoDispose, um die Controller aktiv zu lassen
final syncedScrollControllersProvider = StateNotifierProvider<SyncedScrollControllers, List<ScrollController>>((ref) {
  return SyncedScrollControllers();
});
