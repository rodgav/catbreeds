import 'package:thecat_rodgav/application/utils/base_usecase.dart';
import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';

class StreamLocaleAppPreferencesUseCase
    extends BaseUseCaseStream<void, AppPreferencesModel> {
  final Repository _repository;

  StreamLocaleAppPreferencesUseCase(this._repository);

  @override
  Stream<Either<Failure, AppPreferencesModel>> execute(void input) =>
      _repository.streamLocalAppPreferences();
}
