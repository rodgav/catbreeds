import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:thecat_rodgav/application/constants/assets_constant.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/string_constant.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';
import 'package:thecat_rodgav/application/utils/extensions/string_extension.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';
import 'package:thecat_rodgav/view/splash/splash_cubit/splash_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SplashCubit>().callFirstService();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CatResponsive(
      widget: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccess) {
              context.goCats();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TheCatStrings.title.capitalize(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TheCatsDoubles.d20),
              const SizedBox(
                height: TheCatsDoubles.d200,
                width: double.infinity,
                child: RiveAnimation.asset(
                  TheCatAssets.cat,
                  animations: [TheCatAssets.catAnimation],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
