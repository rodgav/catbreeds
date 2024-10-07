import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thecat_rodgav/view/cats/cats_search/cats_search_bloc/cats_search_bloc.dart';
import 'package:thecat_rodgav/view/model/breed.dart';
import 'package:thecat_rodgav/view/widgets/breed_tile.dart';

class CatsSearch extends SearchDelegate {
  final CatsSearchBloc catsSearchBloc;
  final List<Breed> breeds;

  CatsSearch({required this.catsSearchBloc, required this.breeds});

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query.isEmpty ? close(context, null) : query = '',
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    catsSearchBloc.add(OnSearchEvent(query.trim()));
    return BlocBuilder<CatsSearchBloc, CatsSearchState>(
        bloc: catsSearchBloc,
        builder: (context, state) {
          switch (state) {
            case CatsSearchInitial _:
            case CatsSearchLoading _:
              return const Center(child: CircularProgressIndicator());
            case CatsSearchSuccess _:
              final breed = state.breed;
              return BreedTileWidget(breed);
            case CatsSearchError():
              return const Center(child: Text('No results'));
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return breeds.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, index) {
              return BreedTileWidget(breeds[index]);
            },
            itemCount: breeds.length,
          )
        : const Center(child: Text('No suggestions'));
  }
}
