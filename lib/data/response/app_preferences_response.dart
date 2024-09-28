import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thecat_rodgav/application/constants/box_constant.dart';
import 'package:thecat_rodgav/application/constants/int_constant.dart';

part 'app_preferences_response.g.dart';

@HiveType(typeId: BoxConstant.appPrefsTypeId)
class AppPreferencesResponse extends HiveObject {
  @HiveField(TheCatsInts.i0, defaultValue: AppLocaleResponse.es)
  final AppLocaleResponse appLocale;
  @HiveField(TheCatsInts.i1, defaultValue: true)
  final bool darkMode;

  AppPreferencesResponse(
      {this.appLocale = AppLocaleResponse.es, this.darkMode = true});
}

@HiveType(typeId: BoxConstant.appLocaleTypeId)
enum AppLocaleResponse {
  @HiveField(TheCatsInts.i0)
  es,
  @HiveField(TheCatsInts.i1)
  en,
}

extension AppLocaleResponseExtension on AppLocaleResponse {
  String get locateString {
    switch (this) {
      case AppLocaleResponse.es:
        return 'es';
      case AppLocaleResponse.en:
        return 'en';
    }
  }

  Locale get locale {
    switch (this) {
      case AppLocaleResponse.es:
        return const Locale('es');
      case AppLocaleResponse.en:
        return const Locale('en');
    }
  }
}
