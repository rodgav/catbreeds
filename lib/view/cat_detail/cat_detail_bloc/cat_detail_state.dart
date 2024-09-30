part of 'cat_detail_bloc.dart';

@immutable
sealed class CatDetailState {}

final class CatDetailInitial extends CatDetailState {}

final class CatDetailSuccess extends CatDetailState {
  final Breed breed;
  final List<String> data;

  CatDetailSuccess(this.breed, this.data);
}
