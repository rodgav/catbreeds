part of 'cats_bloc.dart';

@immutable
sealed class CatsEvent {}

class OnGetBreeds extends CatsEvent {
  final bool isRefresh;
  final bool isLoad;
  final int page;

  OnGetBreeds(
      {this.isRefresh = false, this.isLoad = false, required this.page});
}
