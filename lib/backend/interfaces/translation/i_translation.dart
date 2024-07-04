import 'package:snackautomat_24/backend/interfaces/translation/de_translation.dart';
import 'package:snackautomat_24/backend/interfaces/translation/en_translation.dart';

abstract class ITranslation {
  // general
  String get languageCode;
  String get settingsScreenTitle;

  // vending machine display messages
  String get displayMessageGreeting;

  factory ITranslation.fromString(String languageCode) {
    switch (languageCode) {
      case 'en':
        return EnTranslation();
      case 'de':
        return DeTranslation();
      default:
        return EnTranslation();
    }
  }
}
