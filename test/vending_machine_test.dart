import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:test/test.dart';

void main() {
  test('Vending Machine', () {
    VendingMachine vendingMachine = VendingMachine.standard();
    expect(vendingMachine.id, isNotNull);
    print('VendingMachine:\n');
    print('VendingMachine.id: ${vendingMachine.id}');
    print('VendingMachine.name: ${vendingMachine.name}');
    print('CoinOutput: ${vendingMachine.coinOutput}\n');

    print('SlotContainer:\n');
    print('SlotContainer.slotRows: ${vendingMachine.slotContainer.slotRows}');
    print('SlotContainer.slotColumns: ${vendingMachine.slotContainer.slotColumns}');
    vendingMachine.slotContainer.slots.keys.forEach((key) {
      print('SlotContainer.slots: $key');
    });

    print('\nCoinCassette\n');
    print('CoinCassette.id: ${vendingMachine.coinCassette?.id}');
    vendingMachine.coinCassette?.coinTubes.forEach((key, value) {
      print('CoinCassette.coinTubes: $key: ${value.length}');
    });
    print('CoinCassette.tubesCapacity: ${vendingMachine.coinCassette?.tubesCapacity}');
    print('CoinCassette.fillLevels: ${vendingMachine.coinCassette?.fillLevels}\n');

    print('CoinSafe:\n');
    print('CoinSafe.id: ${vendingMachine.coinSafe?.id}');
    print('CoinSafe.coins: ${vendingMachine.coinSafe?.coins}');
    print('CoinSafe.maxCapacity: ${vendingMachine.coinSafe?.maxCapacity}');
    print('CoinSafe.fillLevel: ${vendingMachine.coinSafe?.fillLevel}');
    print('CoinSafe.totalAmount: ${vendingMachine.coinSafe?.totalAmount}\n');

    print('CoinCache:\n');
    print('CoinCache.coinTubes: ${vendingMachine.coinCache.coinTubes}');
    print('CoinCache.tubesCapacity: ${vendingMachine.coinCache.tubesCapacity}');
    print('CoinCache.fillLevels: ${vendingMachine.coinCache.fillLevels}');
    print('CoinCache.totalAmount: ${vendingMachine.coinCache.totalAmount}\n');

    print('DataStorage:\n');
    print('DataStorage.id: ${vendingMachine.dataStorage.id}');
    print('DataStorage.transactionLog: ${vendingMachine.dataStorage.transactionLog}');
    print('DataStorage.salesRevenue: ${vendingMachine.dataStorage.salesRevenue}\n');

    print('VendingController:\n');
    print('VendingController.displayMessage: ${vendingMachine.vendingController.displayMessage}');
    print('VendingController.displayPrice: ${vendingMachine.vendingController.selectedProduct}');
    print('VendingController.cacheAmount: ${vendingMachine.vendingController.cacheAmount}\n');

    print('ProductDispensor:\n');
    print('ProductDispensor.products: ${vendingMachine.productDispensor.content}');
    print('ProductDispensor.selectedProduct: ${vendingMachine.productDispensor.maxCapacity}');
  });
}
