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
import 'package:thecat_rodgav/data/network/dio_client.dart';
import 'package:thecat_rodgav/view/cats/cats_bloc/cats_bloc.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';
import 'package:thecat_rodgav/view/model/app_preferences.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

class CatsView extends StatefulWidget {
  CatsView({super.key});

  @override
  State<CatsView> createState() => _CatsViewState();
}

class _CatsViewState extends State<CatsView> {
  final s = getIt<S>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CatsBloc>().add(OnGetBreeds());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CatResponsive(
        widget: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TheCatsDoubles.d8, vertical: TheCatsDoubles.d10),
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (appContext, appState) {
            final appPreferences =
                (appState as ApplicationInitial).appPreferences;
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
                BlocBuilder<CatsBloc, CatsState>(
                  builder: (context, state) {
                    switch (state) {
                      case CatsInitial _:
                        return const SliverToBoxAdapter(
                            child: Center(
                          child: CircularProgressIndicator(),
                        ));
                      case CatsError _:
                        return SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: TheCatsDoubles.d20),
                          child: Column(
                            children: [
                              Text(
                                state.title,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                state.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ));
                      case CatsSuccess _:
                        final breeds = state.breeds;
                        return SliverList.builder(
                          itemBuilder: (context, index) {
                            return BreedWidget(s, breeds[index]);
                          },
                          itemCount: breeds.length,
                        );
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}

class BreedWidget extends StatelessWidget {
  final S _s;
  final Breed _breed;

  const BreedWidget(this._s, this._breed, {super.key});

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(_breed.name),
                  GestureDetector(
                      onTap: () {
                        context.pushCatDetail(_breed.id, _breed);
                      },
                      child: Text(_s.more.capitalize()))
                ],
              ),
              const SizedBox(height: TheCatsDoubles.d8),
              Expanded(
                  child: _breed.image.url.isNotEmpty
                      ? Image.network(
                          headers: const {xApiKey: xApiKeyValue},
                          _breed.image.url)
                      : Image.asset(TheCatImages.cats)),
              const SizedBox(height: TheCatsDoubles.d8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(_breed.origin),
                  Text(_breed.intelligence.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
