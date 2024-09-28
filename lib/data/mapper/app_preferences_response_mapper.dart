import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';

extension AppPreferencesResponseMapper on AppPreferencesResponse {
  AppPreferencesModel dataToDomain() {
    return AppPreferencesModel(
        appLocale: appLocale.dataToDomain(), darkMode: darkMode);
  }
}

extension AppLocaleResponseExtension on AppLocaleResponse {
  AppLocaleModel dataToDomain() {
    switch (this) {
      case AppLocaleResponse.es:
        return AppLocaleModel.es;
      case AppLocaleResponse.en:
        return AppLocaleModel.en;
    }
  }
}
