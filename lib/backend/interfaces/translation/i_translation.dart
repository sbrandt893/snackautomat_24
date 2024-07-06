import 'package:snackautomat_24/backend/interfaces/translation/de_translation.dart';
import 'package:snackautomat_24/backend/interfaces/translation/en_translation.dart';

abstract class ITranslation {
  // general
  String get languageCode;
  String get settingsScreenTitle;

  // vending machine display messages
  String get dmGreeting;
  String get dmSelectProduct;
  String get dmInsertCoin;
  String get dmFarewell;
  String get noTranslation;

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
