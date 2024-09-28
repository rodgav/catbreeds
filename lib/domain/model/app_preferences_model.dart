class AppPreferencesModel {
  final AppLocaleModel appLocale;
  final bool darkMode;

  AppPreferencesModel({required this.appLocale, required this.darkMode});
}

enum AppLocaleModel {
  es,
  en,
}
