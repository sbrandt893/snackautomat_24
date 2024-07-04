import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/coin_safe.dart';

class CoinSafeNotifier extends StateNotifier<CoinSafe> {
  CoinSafeNotifier() : super(CoinSafe.empty());
}
