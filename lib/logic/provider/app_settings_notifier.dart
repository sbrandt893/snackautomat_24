import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/interfaces/translation/en_translation.dart';
import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';
import 'package:snackautomat_24/backend/models/app_settings.dart';

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier()
      : super(AppSettings(
          translation: EnTranslation(),
        ));

  void changeTranslation() {
    state = state.copyWith(
      translation: state.translation.languageCode == 'en' ? ITranslation.fromString('de') : ITranslation.fromString('en'),
    );
  }
}
