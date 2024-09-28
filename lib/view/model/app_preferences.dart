
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';

class AppPreferences {
  final AppLocale appLocale;
  final bool darkMode;

  AppPreferences({required this.appLocale, required this.darkMode});

  AppPreferences copyWith(AppLocale? appLocale, bool? darkMode) {
    return AppPreferences(
        appLocale: appLocale ?? this.appLocale,
        darkMode: darkMode ?? this.darkMode);
  }
}

enum AppLocale {
  es,
  en,
}

extension AppPreferencesExtension on AppPreferences {
  AppPreferencesModel viewToDomain() {
    return AppPreferencesModel(
        appLocale: appLocale.viewToDomain(), darkMode: darkMode);
  }
}

extension AppLocaleExtension on AppLocale {
  AppLocaleModel viewToDomain() {
    switch (this) {
      case AppLocale.es:
        return AppLocaleModel.es;
      case AppLocale.en:
        return AppLocaleModel.en;
    }
  }

  String getName() {
    switch (this) {
      case AppLocale.es:
        return 'es';
      case AppLocale.en:
        return 'en';
    }
  }
}
