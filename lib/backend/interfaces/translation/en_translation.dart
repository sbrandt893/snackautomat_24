import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';

class EnTranslation implements ITranslation {
  EnTranslation() : super();

  @override
  String get languageCode => 'en';
  @override
  String get settingsScreenTitle => 'Settings';

  // vending machine display messages
  @override
  String get dmGreeting => 'Happy Vending!';
  @override
  String get dmSelectProduct => 'Please select a product';
  @override
  String get dmInsertCoin => 'Please insert coins';
  @override
  String get dmFarewell => 'Goodbye!';
  @override
  String get noTranslation => 'No translation found';
}
