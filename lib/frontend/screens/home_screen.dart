import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/frontend/router/app_router.dart';
import 'package:snackautomat_24/frontend/widgets/custom_scaffold.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
        appbarTitle: 'The golden Snack',
        appbarActions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, Routes.settings.name),
              icon: const Icon(
                Icons.settings,
                size: 27,
              ))
        ],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, fixedSize: const Size(175, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.game.name);
                },
                child: const Text('Start Game', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
            ],
          ),
        ));

    // Container(
    //   color: Colors.amberAccent.shade100,
    //   child: SafeArea(
    //     child: Scaffold(
    //         appBar: AppBar(
    //           title: const Text(
    //             'The golden Snack',
    //             style: TextStyle(fontSize: 27),
    //           ),
    //           backgroundColor: Colors.amber,
    //           actions: [
    //             IconButton(
    //               icon: const Icon(
    //                 Icons.settings,
    //                 size: 27,
    //               ),
    //               onPressed: () {
    //                 Navigator.pushNamed(context, Routes.settings.name);
    //               },
    //             ),
    //           ],
    //         ),
    //         body: Container(
    //           color: Colors.amberAccent.shade100,
    //           child: Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 ElevatedButton(
    //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, fixedSize: const Size(175, 50)),
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, Routes.game.name);
    //                   },
    //                   child: const Text('Start Game', style: TextStyle(fontSize: 22, color: Colors.black)),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )),
    //   ),
    // );
  }
}
