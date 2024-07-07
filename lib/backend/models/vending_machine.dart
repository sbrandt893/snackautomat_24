import 'package:snackautomat_24/backend/models/coin.dart';
import 'package:snackautomat_24/backend/models/coin_cache.dart';
import 'package:snackautomat_24/backend/models/coin_cassette.dart';
import 'package:snackautomat_24/backend/models/coin_safe.dart';
import 'package:snackautomat_24/backend/models/data_storage.dart';
import 'package:snackautomat_24/backend/models/glas_pane.dart';
import 'package:snackautomat_24/backend/models/nullable_wrapper.dart';
import 'package:snackautomat_24/backend/models/product_dispensor.dart';
import 'package:snackautomat_24/backend/models/slot_container.dart';
import 'package:snackautomat_24/backend/models/vending_controller.dart';
import 'package:uuid/uuid.dart';

class VendingMachine {
  final String id;
  final String name;
  final List<Coin> coinOutput;
  final CoinCache coinCache;
  final CoinCassette? coinCassette;
  final CoinSafe? coinSafe;
  final DataStorage dataStorage;
  final ProductDispensor productDispensor;
  final SlotContainer slotContainer;
  final VendingController vendingController;
  final GlassPane? glassPane;

  VendingMachine({
    required this.name,
    required this.slotContainer,
    required this.coinCassette,
    required this.coinSafe,
    required this.coinCache,
    required this.coinOutput,
    required this.dataStorage,
    required this.vendingController,
    required this.productDispensor,
    required this.glassPane,
  }) : id = const Uuid().v4();

  VendingMachine copyWith({
    String? name,
    SlotContainer? slotContainer,
    CoinCassette? coinCassette,
    CoinSafe? coinSafe,
    CoinCache? coinCache,
    List<Coin>? coinOutput,
    DataStorage? dataStorage,
    VendingController? vendingController,
    ProductDispensor? productDispensor,
    Wrapper<GlassPane?>? glassPane,
  }) {
    return VendingMachine(
      name: name ?? this.name,
      slotContainer: slotContainer ?? this.slotContainer,
      coinCassette: coinCassette ?? this.coinCassette,
      coinSafe: coinSafe ?? this.coinSafe,
      coinCache: coinCache ?? this.coinCache,
      coinOutput: coinOutput ?? this.coinOutput,
      dataStorage: dataStorage ?? this.dataStorage,
      vendingController: vendingController ?? this.vendingController,
      productDispensor: productDispensor ?? this.productDispensor,
      glassPane: glassPane != null ? glassPane.value : this.glassPane,
    );
  }

  factory VendingMachine.standard() {
    return VendingMachine(
      name: 'Vending Machine (Standard-Model)',
      slotContainer: SlotContainer.r6c6(),
      coinCassette: CoinCassette.standardFilled(),
      coinSafe: CoinSafe.empty(),
      coinCache: CoinCache.empty(),
      coinOutput: [],
      dataStorage: DataStorage.empty(),
      vendingController: VendingController.standard(),
      productDispensor: ProductDispensor.empty(),
      glassPane: GlassPane.standard(),
    );
  }

  VendingMachine removeGlassPane() {
    return copyWith(
      glassPane: Wrapper(null),
    );
  }

  @override
  String toString() {
    return 'VendingMachine(id: $id, name: $name, coinOutput: $coinOutput, coinCache: $coinCache, coinCassette: $coinCassette, coinSafe: $coinSafe, dataStorage: $dataStorage, productDispensor: $productDispensor, slotContainer: $slotContainer, vendingController: $vendingController, glassPane: $glassPane)';
  }
}
