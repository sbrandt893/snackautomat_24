// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:snackautomat_24/logic/provider/synced_scroll_controllers.dart';

// class SyncedScrollWidgets extends ConsumerWidget {
//   const SyncedScrollWidgets({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controllers = ref.watch(syncedScrollControllersProvider);

//     return Row(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             controller: controllers[0],
//             itemCount: 100,
//             itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             controller: controllers[1],
//             itemCount: 100,
//             itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
//           ),
//         ),
//       ],
//     );
//   }
// }
