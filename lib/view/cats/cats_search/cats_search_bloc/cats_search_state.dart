part of 'cats_search_bloc.dart';

@immutable
sealed class CatsSearchState {}

final class CatsSearchInitial extends CatsSearchState {}

final class CatsSearchLoading extends CatsSearchState {}

final class CatsSearchSuccess extends CatsSearchState {
  final Breed breed;

  CatsSearchSuccess(this.breed);
}

final class CatsSearchError extends CatsSearchState {
  final String title, message;

  CatsSearchError(this.title, this.message);
}
