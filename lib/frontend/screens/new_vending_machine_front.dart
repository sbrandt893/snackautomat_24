import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/frontend/widgets/custom_bottom_appbar.dart';

class NewVendingMachineFront extends ConsumerStatefulWidget {
  const NewVendingMachineFront({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewVendingMachineFrontState();
}

class _NewVendingMachineFrontState extends ConsumerState<NewVendingMachineFront> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Vending Machine'),
      ),
      body: const Center(
        child: Text('New Vending Machine'),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
