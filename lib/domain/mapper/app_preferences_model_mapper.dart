

import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/view/model/app_preferences.dart';

extension AppPreferencesModelMapper on AppPreferencesModel {
  AppPreferences domainToView() {
    return AppPreferences(
        appLocale: appLocale.domainToView(),
        darkMode: darkMode);
  }

  AppPreferencesResponse domainToData() {
    return AppPreferencesResponse(
        appLocale: appLocale.domainToData(),
        darkMode: darkMode);
  }
}

extension AppLocaleModelExtension on AppLocaleModel {
  AppLocale domainToView() {
    switch (this) {
      case AppLocaleModel.es:
        return AppLocale.es;
      case AppLocaleModel.en:
        return AppLocale.en;
    }
  }

  AppLocaleResponse domainToData() {
    switch (this) {
      case AppLocaleModel.es:
        return AppLocaleResponse.es;
      case AppLocaleModel.en:
        return AppLocaleResponse.en;
    }
  }
}
