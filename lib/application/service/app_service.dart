import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:thecat_rodgav/application/constants/box_constant.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';

class AppService {
  final Box<AppPreferencesResponse> _appPreferencesBox;
  late StreamController<AppPreferencesResponse> _appPreferencesResponseStrCtrl;

  AppService(this._appPreferencesBox) {
    _appPreferencesResponseStrCtrl = StreamController<AppPreferencesResponse>();

    _appPreferencesBox.listenable().addListener(() {
      final appPreferencesBox = _appPreferencesBox.get(BoxConstant.appPrefsBox);
      _appPreferencesResponseStrCtrl.add(AppPreferencesResponse(
          appLocale: appPreferencesBox?.appLocale ?? AppLocaleResponse.es,
          darkMode: appPreferencesBox?.darkMode ?? true));
    });
  }

  Stream<AppPreferencesResponse> streamLocalAppPreferences() =>
      _appPreferencesResponseStrCtrl.stream;

  Future<AppPreferencesResponse> getLocalAppPreferences() async {
    final appPreferences = _appPreferencesBox.get(BoxConstant.appPrefsBox);
    return appPreferences ?? AppPreferencesResponse();
  }

  Future<AppPreferencesResponse> saveAppPreferences(
      AppPreferencesResponse appPreferencesResponse) async {
    await _appPreferencesBox.clear();
    await _appPreferencesBox.put(
        BoxConstant.appPrefsBox, appPreferencesResponse);
    _appPreferencesResponseStrCtrl.add(appPreferencesResponse);
    return await getLocalAppPreferences();
  }
}
