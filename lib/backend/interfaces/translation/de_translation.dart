import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';

class DeTranslation implements ITranslation {
  DeTranslation() : super();

  // general
  @override
  String get languageCode => 'de';
  @override
  String get settingsScreenTitle => 'Einstellungen';

  // vending machine display messages
  @override
  String get dmGreeting => 'Willkommen!';
  @override
  String get dmSelectProduct => 'Bitte wählen Sie ein Produkt';
  @override
  String get dmInsertCoin => 'Bitte werfen Sie Münzen ein';
  @override
  String get dmFarewell => 'Auf Wiedersehen!';
  @override
  String get noTranslation => 'Keine Übersetzung gefunden';
}
