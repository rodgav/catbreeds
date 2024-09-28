part of 'application_bloc.dart';

@immutable
sealed class ApplicationEvent {}

class OnGetAppPreferences extends ApplicationEvent {}

class OnSaveAppPreferences extends ApplicationEvent {
  final AppPreferences appPreferences;

  OnSaveAppPreferences(this.appPreferences);
}
