import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thecat_rodgav/application/constants/box_constant.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/application/service/app_service.dart';
import 'package:thecat_rodgav/application/utils/application_bloc/application_bloc.dart';
import 'package:thecat_rodgav/data/datasource/local_datasource.dart';
import 'package:thecat_rodgav/data/datasource/local_datasource_impl.dart';
import 'package:thecat_rodgav/data/local/hive.dart';
import 'package:thecat_rodgav/data/network/dio_client.dart';
import 'package:thecat_rodgav/data/repository/repository_impl.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';
import 'package:thecat_rodgav/domain/usecases/get_locale_app_preferences_usecase.dart';
import 'package:thecat_rodgav/domain/usecases/save_app_preferences_usecase.dart';
import 'package:thecat_rodgav/domain/usecases/stream_locale_app_preferences_usecase.dart';
import 'package:thecat_rodgav/view/cat_detail/cat_detail_bloc/cat_detail_bloc.dart';
import 'package:thecat_rodgav/view/cats/cats_bloc/cats_bloc.dart';
import 'package:thecat_rodgav/view/splash/splash_cubit/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  getIt.registerLazySingleton<S>(() => S());
  final dio = await getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  await _initCoreBoxes();

  getIt.registerLazySingleton<Repository>(
      () => RepositoryImpl(getIt<LocalDataSource>()));

  getIt.registerLazySingleton<SaveAppPreferencesUseCase>(
      () => SaveAppPreferencesUseCase(getIt<Repository>()));
  getIt.registerLazySingleton<StreamLocaleAppPreferencesUseCase>(
      () => StreamLocaleAppPreferencesUseCase(getIt<Repository>()));
  getIt.registerLazySingleton<GetLocaleAppPreferencesUseCase>(
      () => GetLocaleAppPreferencesUseCase(getIt<Repository>()));

  getIt.registerLazySingleton<ApplicationBloc>(() => ApplicationBloc(
      getIt<StreamLocaleAppPreferencesUseCase>(),
      getIt<SaveAppPreferencesUseCase>(),
      getIt<Box<AppPreferencesResponse>>()));
}

void initSplash() {
  if (!GetIt.I.isRegistered<SplashCubit>()) {
    getIt.registerLazySingleton<SplashCubit>(() => SplashCubit());
  }
}

void initCats() {
  if (!GetIt.I.isRegistered<CatsBloc>()) {
    getIt.registerLazySingleton<CatsBloc>(() => CatsBloc());
  }
}

void initCatDetail() {
  if (!GetIt.I.isRegistered<CatDetailBloc>()) {
    getIt.registerLazySingleton<CatDetailBloc>(() => CatDetailBloc());
  }
}

Future<void> _initCoreBoxes() async {
  await HiveFactory().initHive();
  if (!Hive.isAdapterRegistered(BoxConstant.appPrefsTypeId)) {
    Hive.registerAdapter(AppPreferencesResponseAdapter());
    Hive.registerAdapter(AppLocaleResponseAdapter());
  }
  if (!Hive.isBoxOpen(BoxConstant.appPrefsBox)) {
    final appPreferencesAdapter =
        await Hive.openBox<AppPreferencesResponse>(BoxConstant.appPrefsBox);
    final appLocaleAdapter =
        await Hive.openBox<AppLocaleResponse>(BoxConstant.appLocaleBox);

    getIt.registerLazySingleton<Box<AppPreferencesResponse>>(
        () => appPreferencesAdapter);
    getIt.registerLazySingleton<Box<AppLocaleResponse>>(() => appLocaleAdapter);

    getIt.registerLazySingleton<AppService>(
        () => AppService(getIt<Box<AppPreferencesResponse>>()));
    getIt.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(getIt<AppService>()));
  }
}
