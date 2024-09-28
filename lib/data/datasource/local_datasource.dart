import 'package:thecat_rodgav/data/response/app_preferences_response.dart';

abstract class LocalDataSource {
  Stream<AppPreferencesResponse> streamLocalAppPreferences();

  Future<AppPreferencesResponse> getLocalAppPreferences();

  Future<AppPreferencesResponse> saveAppPreferences(
      AppPreferencesResponse appPreferencesResponse);
}
