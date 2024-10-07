part of 'cats_bloc.dart';

@immutable
sealed class CatsState {}

final class CatsInitial extends CatsState {}

final class CatsLoading extends CatsState {}

final class CatsSuccess extends CatsState {
  final List<Breed> breeds;

  CatsSuccess(this.breeds);
}

final class CatsError extends CatsState {
  final String title, message;

  CatsError(this.title, this.message);
}
