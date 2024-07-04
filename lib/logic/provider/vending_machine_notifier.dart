import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';

class VendingMachineNotifier extends StateNotifier<VendingMachine> {
  VendingMachineNotifier() : super(VendingMachine.standard());
}
