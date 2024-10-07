import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/int_constant.dart';
import 'package:thecat_rodgav/application/constants/string_constant.dart';
import 'package:thecat_rodgav/application/dependency_injection/di.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/application/utils/application_bloc/application_bloc.dart';
import 'package:thecat_rodgav/application/utils/extensions/string_extension.dart';
import 'package:thecat_rodgav/application/utils/pagination_scroll_controller.dart';
import 'package:thecat_rodgav/view/cats/cats_bloc/cats_bloc.dart';
import 'package:thecat_rodgav/view/cats/cats_search/cats_search.dart';
import 'package:thecat_rodgav/view/cats/cats_search/cats_search_bloc/cats_search_bloc.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';
import 'package:thecat_rodgav/view/model/app_preferences.dart';
import 'package:thecat_rodgav/view/model/breed.dart';
import 'package:thecat_rodgav/view/widgets/breed_skeleton_widget.dart';
import 'package:thecat_rodgav/view/widgets/breed_widget.dart';

class CatsView extends StatefulWidget {
  CatsView({super.key});

  @override
  State<CatsView> createState() => _CatsViewState();
}

class _CatsViewState extends State<CatsView> {
  late PaginationScrollController _paginationScrollController;
  final s = getIt<S>();

  @override
  void initState() {
    _paginationScrollController = PaginationScrollController(loadData: (page) {
      context.read<CatsBloc>().add(OnGetBreeds(page: page));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CatsBloc>()
          .add(OnGetBreeds(isLoad: true, page: TheCatsInts.i0));
    });
    super.initState();
  }

  @override
  void dispose() {
    _paginationScrollController.dispose();
    super.dispose();
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
              physics: const BouncingScrollPhysics(),
              controller: _paginationScrollController.scrollController,
              slivers: [
                SliverAppBar(
                  title: Text(TheCatStrings.title.capitalize()),
                  bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 50),
                      child: BlocBuilder<CatsBloc, CatsState>(
                        builder: (_, state) {
                          return GestureDetector(
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  hintText: s.searchCatBreed.capitalize(),
                                  border: const OutlineInputBorder()),
                            ),
                            onTap: () => showSearch(
                                context: context,
                                delegate: CatsSearch(
                                    catsSearchBloc: context.read<CatsSearchBloc>(),
                                    breeds: (state is CatsSuccess)
                                        ? state.breeds
                                        : List<Breed>.empty())),
                          );
                        },
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
                CupertinoSliverRefreshControl(onRefresh: () async {
                  context
                      .read<CatsBloc>()
                      .add(OnGetBreeds(isRefresh: true, page: TheCatsInts.i0));
                  await context.read<CatsBloc>().stream.first;
                }, builder: (_, __, ___, ____, _____) {
                  return const Center(
                      child: SizedBox(
                          width: TheCatsDoubles.d20,
                          height: TheCatsDoubles.d20,
                          child: CircularProgressIndicator()));
                }),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: TheCatsDoubles.d20,
                  ),
                ),
                BlocBuilder<CatsBloc, CatsState>(
                  builder: (context, state) {
                    switch (state) {
                      case CatsLoading _:
                        return SliverList.builder(
                          itemBuilder: (context, index) {
                            return const BreedSkeletonWidget();
                          },
                          itemCount: TheCatsInts.i10,
                        );
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
                      case CatsInitial():
                        return const SliverToBoxAdapter();
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
