part of 'cat_detail_bloc.dart';

@immutable
sealed class CatDetailEvent {}

class OnGetBreedForId extends CatDetailEvent {
  final String id;

  OnGetBreedForId(this.id);
}

class OnSetBreed extends CatDetailEvent {
  final Breed breed;

  OnSetBreed(this.breed);
}
