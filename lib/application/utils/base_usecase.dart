import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

abstract class BaseUseCaseStream<In, Out> {
  Stream<Either<Failure, Out>> execute(In input);
}
