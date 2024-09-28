part of 'application_bloc.dart';

@immutable
sealed class ApplicationState {}

final class ApplicationInitial extends ApplicationState {
  final AppPreferences appPreferences;

  ApplicationInitial(this.appPreferences);
}
