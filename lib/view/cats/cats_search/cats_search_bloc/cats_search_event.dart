part of 'cats_search_bloc.dart';

@immutable
sealed class CatsSearchEvent {}

class OnSearchEvent extends CatsSearchEvent{
  final String breedId;

  OnSearchEvent(this.breedId);
}