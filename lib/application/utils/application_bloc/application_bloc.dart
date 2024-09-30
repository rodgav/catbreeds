import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:thecat_rodgav/application/constants/box_constant.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/mapper/app_preferences_model_mapper.dart';
import 'package:thecat_rodgav/domain/usecases/save_app_preferences_usecase.dart';
import 'package:thecat_rodgav/domain/usecases/stream_locale_app_preferences_usecase.dart';
import 'package:thecat_rodgav/view/model/app_preferences.dart';
import 'package:thecat_rodgav/data/mapper/app_preferences_response_mapper.dart';

part 'application_event.dart';

part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final StreamLocaleAppPreferencesUseCase _streamLocaleAppPreferencesUseCase;
  final SaveAppPreferencesUseCase _saveAppPreferencesUseCase;
  final Box<AppPreferencesResponse> _box;

  ApplicationBloc(this._streamLocaleAppPreferencesUseCase,
      this._saveAppPreferencesUseCase, this._box)
      : super(ApplicationInitial(
            _box.get(BoxConstant.appPrefsBox)?.dataToDomain().domainToView() ??
                AppPreferences(appLocale: AppLocale.es, darkMode: true))) {
    on<ApplicationEvent>((event, emit) {});
    on<OnGetAppPreferences>(_onGetAppPreferences);
    on<OnSaveAppPreferences>(_onSaveAppPreferences);
  }

  FutureOr<void> _onGetAppPreferences(
      OnGetAppPreferences event, Emitter<ApplicationState> emit) {
    final appPreferencesModel =
        _streamLocaleAppPreferencesUseCase.execute(null);
    appPreferencesModel.map((data) {
      data.when(left: (value) {
        emit(ApplicationInitial(
            AppPreferences(appLocale: AppLocale.es, darkMode: true)));
      }, right: (value) {
        emit(ApplicationInitial(value.domainToView()));
      });
    });
  }

  FutureOr<void> _onSaveAppPreferences(
      OnSaveAppPreferences event, Emitter<ApplicationState> emit) async {
    (await _saveAppPreferencesUseCase
            .execute(event.appPreferences.viewToDomain()))
        .when(
            left: (left) => emit(ApplicationInitial(_box
                    .get(BoxConstant.appPrefsBox)
                    ?.dataToDomain()
                    .domainToView() ??
                AppPreferences(appLocale: AppLocale.es, darkMode: true))),
            right: (right) async {
              emit(ApplicationInitial(event.appPreferences));
                await S.load(Locale(event.appPreferences.appLocale.getName()));
            });
  }
}
