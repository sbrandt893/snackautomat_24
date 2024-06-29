import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';

class EnTranslation implements ITranslation {
  EnTranslation() : super();

  @override
  String get languageCode => 'en';
  @override
  String get settingsScreenTitle => 'Settings';

  // vending machine display messages
  @override
  String get displayMessageGreeting => 'Welcome!';
}
