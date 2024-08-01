import 'dart:developer';

import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:test/test.dart';

void main() {
  test('Vending Machine', () {
    VendingMachine vendingMachine = VendingMachine.standard();
    expect(vendingMachine.id, isNotNull);
    log('VendingMachine: \n');
    log('VendingMachine.id: ${vendingMachine.id}');
    log('VendingMachine.name: ${vendingMachine.name}');
    log('CoinOutput: ${vendingMachine.coinOutput}\n');

    log('SlotContainer: \n');
    log('SlotContainer.slotRows: ${vendingMachine.slotContainer.slotRows}');
    log('SlotContainer.slotColumns: ${vendingMachine.slotContainer.slotCols}');
    for (var key in vendingMachine.slotContainer.slots.keys) {
      log('SlotContainer.slots: $key');
    }

    log('\nCoinCassette\n');
    log('CoinCassette.id: ${vendingMachine.coinCassette?.id}');
    vendingMachine.coinCassette?.coinTubes.forEach((key, value) {
      log('CoinCassette.coinTubes: $key: ${value.length}');
    });
    log('CoinCassette.tubesCapacity: ${vendingMachine.coinCassette?.tubesCapacity}');
    log('CoinCassette.fillLevels: ${vendingMachine.coinCassette?.fillLevels}\n');

    log('CoinSafe:\n');
    log('CoinSafe.id: ${vendingMachine.coinSafe?.id}');
    log('CoinSafe.coins: ${vendingMachine.coinSafe?.coins}');
    log('CoinSafe.maxCapacity: ${vendingMachine.coinSafe?.maxCapacity}');
    log('CoinSafe.fillLevel: ${vendingMachine.coinSafe?.fillLevel}');
    log('CoinSafe.totalAmount: ${vendingMachine.coinSafe?.totalAmount}\n');

    log('CoinCache:\n');
    log('CoinCache.coinTubes: ${vendingMachine.coinCache.coinTubes}');
    log('CoinCache.tubesCapacity: ${vendingMachine.coinCache.tubesCapacity}');
    log('CoinCache.fillLevels: ${vendingMachine.coinCache.fillLevels}');
    log('CoinCache.totalAmount: ${vendingMachine.coinCache.totalAmount}\n');

    log('DataStorage:\n');
    log('DataStorage.id: ${vendingMachine.dataStorage.id}');
    log('DataStorage.transactionLog: ${vendingMachine.dataStorage.transactionLog}');
    log('DataStorage.salesRevenue: ${vendingMachine.dataStorage.salesRevenue}\n');

    log('VendingController:\n');
    log('VendingController.displayMessage: ${vendingMachine.vendingController.displayMessage}');
    log('VendingController.displayPrice: ${vendingMachine.vendingController.selectedSlot}');
    log('VendingController.cacheAmount: ${vendingMachine.vendingController.cacheAmount}\n');

    log('ProductDispensor:\n');
    log('ProductDispensor.products: ${vendingMachine.productDispensor.content}');
    log('ProductDispensor.selectedProduct: ${vendingMachine.productDispensor.maxCapacity}');
  });
}
