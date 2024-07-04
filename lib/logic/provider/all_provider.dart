import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/app_settings.dart';
import 'package:snackautomat_24/backend/models/coin_safe.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/logic/provider/app_settings_notifier.dart';
import 'package:snackautomat_24/logic/provider/coin_safe_notifier.dart';
import 'package:snackautomat_24/logic/provider/game_state_notifier.dart';
import 'package:snackautomat_24/logic/provider/vending_machine_notifier.dart';

final appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  return AppSettingsNotifier();
});

final vendingMachineProvider = StateNotifierProvider<VendingMachineNotifier, VendingMachine>((ref) {
  return VendingMachineNotifier();
});

final coinSafeProvider = StateNotifierProvider<CoinSafeNotifier, CoinSafe>((ref) {
  return CoinSafeNotifier();
});

final coinCassetteProvider = StateNotifierProvider<CoinSafeNotifier, CoinSafe>((ref) {
  return CoinSafeNotifier();
});

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  return GameStateNotifier();
});
