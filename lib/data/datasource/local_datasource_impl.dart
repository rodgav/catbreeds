


import 'package:thecat_rodgav/application/service/app_service.dart';
import 'package:thecat_rodgav/data/datasource/local_datasource.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final AppService _appService;

  LocalDataSourceImpl(this._appService);

  @override
  Stream<AppPreferencesResponse> streamLocalAppPreferences() =>
      _appService.streamLocalAppPreferences();

  @override
  Future<AppPreferencesResponse> getLocalAppPreferences() =>
      _appService.getLocalAppPreferences();

  @override
  Future<AppPreferencesResponse> saveAppPreferences(
          AppPreferencesResponse appPreferencesResponse) =>
      _appService.saveAppPreferences(appPreferencesResponse);
}
