import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/nullable_wrapper.dart';
import 'package:snackautomat_24/backend/models/product.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';

class VendingMachineNotifier extends StateNotifier<VendingMachine> {
  VendingMachineNotifier() : super(VendingMachine.standard());

  void addProduct(String slotNumber, Product product) {
    state = state.copyWith(
      slotContainer: state.slotContainer.copyWith(
        slots: Map.from(state.slotContainer.slots)
          ..update(
            slotNumber,
            (slot) => slot.addProduct(product: product),
            ifAbsent: () => throw Exception('Slot $slotNumber does not exist'),
          ),
      ),
    );
  }

  void removeProduct(String slotNumber) {
    state = state.copyWith(
      slotContainer: state.slotContainer.copyWith(
        slots: Map.from(state.slotContainer.slots)
          ..update(
            slotNumber,
            (slot) => slot.removeProduct(),
            ifAbsent: () => throw Exception('Slot $slotNumber does not exist'),
          ),
      ),
    );
  }

// damage the glas pane and add crack to it
  void damageGlassPane({required int damageAmount}) {
    if (state.glassPane == null) {
      throw Exception('Glas pane does not exist');
    }
    state = state.copyWith(
      glassPane: Wrapper(state.glassPane!.damage(damageAmount: damageAmount)),
    );
  }

  void repairGlassPane() {
    if (state.glassPane == null) {
      throw Exception('Glas pane does not exist');
    }
    state = state.copyWith(
      glassPane: Wrapper(state.glassPane!.repair()),
    );
  }

  void addCrackToGlassPane({required Offset crack}) {
    if (state.glassPane == null) {
      throw Exception('Glas pane does not exist');
    }
    state = state.copyWith(
      glassPane: Wrapper(state.glassPane!.addCrack(crack: crack)),
    );
  }

  void removeGlassPane() {
    state = state.copyWith(
      glassPane: Wrapper(null),
    );
  }
}
