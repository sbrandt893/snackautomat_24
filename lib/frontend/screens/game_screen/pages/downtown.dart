import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class Downtown extends ConsumerWidget {
  const Downtown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Downtown', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        const Text('[Work in progress]', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            ref.read(gameStateProvider.notifier).setCurrentPage(0);
          },
          child: const Text('Back to Uptown'),
        ),
      ],
    ));
  }
}
