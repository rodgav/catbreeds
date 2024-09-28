import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thecat_rodgav/application/dependency_injection/di.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/application/resources/theme/cat_theme.dart';
import 'package:thecat_rodgav/application/router/router.dart';
import 'package:thecat_rodgav/application/utils/application_bloc/application_bloc.dart';
import 'package:thecat_rodgav/view/model/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
        create: (context) => getIt<ApplicationBloc>(),
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            final appPreferences = (state as ApplicationInitial).appPreferences;
            return MaterialApp.router(
              title: 'TheCatRodGav',
              theme: CatTheme().light(),
              darkTheme: CatTheme().dark(),
              themeMode:
                  appPreferences.darkMode ? ThemeMode.dark : ThemeMode.light,
              supportedLocales: [
                Locale(AppLocale.es.getName()),
                Locale(AppLocale.en.getName())
              ],
              locale: Locale(appPreferences.appLocale.getName()),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerDelegate: Router.router.routerDelegate,
              routeInformationProvider: Router.router.routeInformationProvider,
              routeInformationParser: Router.router.routeInformationParser,
            );
          },
        ));
  }
}
