import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/coin_cassette.dart';

class CoinCassetteNotifier extends StateNotifier<CoinCassette> {
  CoinCassetteNotifier() : super(CoinCassette.standardFilled());
}
