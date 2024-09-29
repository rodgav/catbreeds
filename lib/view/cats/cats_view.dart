import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/image_constant.dart';
import 'package:thecat_rodgav/application/constants/string_constant.dart';
import 'package:thecat_rodgav/application/dependency_injection/di.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';
import 'package:thecat_rodgav/application/utils/application_bloc/application_bloc.dart';
import 'package:thecat_rodgav/application/utils/extensions/string_extension.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';
import 'package:thecat_rodgav/view/model/app_preferences.dart';

class CatsView extends StatelessWidget {
  CatsView({super.key});

  final s = getIt<S>();

  @override
  Widget build(BuildContext context) {
    return CatResponsive(
        widget: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TheCatsDoubles.d8, vertical: TheCatsDoubles.d10),
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            final appPreferences = (state as ApplicationInitial).appPreferences;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(TheCatStrings.title.capitalize()),
                  bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 50),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: s.searchCatBreed.capitalize(),
                            border: const OutlineInputBorder()),
                      )),
                  actions: [
                    GestureDetector(
                      child: appPreferences.darkMode
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                      onTap: () {
                        context.read<ApplicationBloc>().add(
                            OnSaveAppPreferences(appPreferences.copyWith(
                                null, !appPreferences.darkMode)));
                      },
                    ),
                    const SizedBox(width: TheCatsDoubles.d20),
                    GestureDetector(
                      child: Text(appPreferences.appLocale.getName()),
                      onTap: () async {
                        final es = appPreferences.appLocale == AppLocale.es;
                        context.read<ApplicationBloc>().add(
                            OnSaveAppPreferences(appPreferences.copyWith(
                                es ? AppLocale.en : AppLocale.es, null)));
                      },
                    ),
                    const SizedBox(width: TheCatsDoubles.d20),
                  ],
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: TheCatsDoubles.d20,
                  ),
                ),
                SliverList.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: TheCatsDoubles.d8),
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(TheCatsDoubles.d8),
                          width: double.infinity,
                          height: TheCatsDoubles.d350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('Nombre Raza'),
                                  GestureDetector(
                                      onTap: () {
                                        context.pushCatDetail('cat',null);
                                      },
                                      child: Text('Más...'))
                                ],
                              ),
                              const SizedBox(height: TheCatsDoubles.d8),
                              Expanded(child: Image.asset(TheCatImages.cats)),
                              const SizedBox(height: TheCatsDoubles.d8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('País de origen'),
                                  Text('Inteligencia'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}
