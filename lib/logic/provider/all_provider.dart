import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/app_settings.dart';
import 'package:snackautomat_24/backend/models/coin_cassette.dart';
import 'package:snackautomat_24/backend/models/coin_safe.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/backend/models/glas_pane.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/logic/provider/synced_scroll_controllers.dart';
import 'package:snackautomat_24/logic/provider/app_settings_notifier.dart';
import 'package:snackautomat_24/logic/provider/coin_cassette_notifier.dart';
import 'package:snackautomat_24/logic/provider/coin_safe_notifier.dart';
import 'package:snackautomat_24/logic/provider/game_state_notifier.dart';
import 'package:snackautomat_24/logic/provider/glas_pane_notifier.dart';
import 'package:snackautomat_24/logic/provider/vending_machine_notifier.dart';

final appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  return AppSettingsNotifier();
});

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  return GameStateNotifier();
});

final vendingMachineProvider = StateNotifierProvider<VendingMachineNotifier, VendingMachine>((ref) {
  return VendingMachineNotifier();
});

final coinSafeProvider = StateNotifierProvider<CoinSafeNotifier, CoinSafe>((ref) {
  return CoinSafeNotifier();
});

final coinCassetteProvider = StateNotifierProvider<CoinCassetteNotifier, CoinCassette>((ref) {
  return CoinCassetteNotifier();
});

final glassPaneProvider = StateNotifierProvider<GlassPaneNotifier, GlassPane>((ref) {
  return GlassPaneNotifier();
});
