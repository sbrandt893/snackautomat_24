import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';

class AppSettings {
  final ITranslation translation;

  AppSettings({
    required this.translation,
  });

  AppSettings copyWith({
    ITranslation? translation,
  }) {
    return AppSettings(
      translation: translation ?? this.translation,
    );
  }

  @override
  String toString() {
    return 'AppSettings{translation: $translation}';
  }
}
