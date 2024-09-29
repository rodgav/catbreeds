import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thecat_rodgav/application/dependency_injection/di.dart';
import 'package:thecat_rodgav/application/router/routes.dart';
import 'package:thecat_rodgav/view/cat_detail/cat_detail_bloc/cat_detail_bloc.dart';
import 'package:thecat_rodgav/view/cat_detail/cat_detail_view.dart';
import 'package:thecat_rodgav/view/cats/cats_bloc/cats_bloc.dart';
import 'package:thecat_rodgav/view/cats/cats_view.dart';
import 'package:thecat_rodgav/view/splash/splash_cubit/splash_cubit.dart';
import 'package:thecat_rodgav/view/splash/splash_view.dart';

class Router {
  static GoRouter router = GoRouter(
      routerNeglect: true,
      debugLogDiagnostics: true,
      initialLocation: Routes.initial,
      routes: [
        GoRoute(
            path: Routes.initial,
            name: Routes.initial,
            builder: (context, state) {
              initSplash();
              return BlocProvider<SplashCubit>(
                  create: (context) => getIt<SplashCubit>(),
                  child: const SplashView());
            }),
        GoRoute(
            path: Routes.cats,
            name: Routes.cats,
            builder: (context, state) {
              initCats();
              return BlocProvider<CatsBloc>(
                  create: (context) => getIt<CatsBloc>(),
                  child: CatsView());
            },
            routes: [
              GoRoute(
                path: '${Routes.catDetail}/:idCat',
                name: Routes.catDetail,
                builder: (context, state) {
                  //state.pathParameters['idCat']
                  //state.extra;
                  initCatDetail();
                  return BlocProvider<CatDetailBloc>(
                      create: (context) => getIt<CatDetailBloc>(),
                      child: const CatDetailView());
                },
              )
            ]),
      ]);
}
