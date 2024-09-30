import 'package:thecat_rodgav/data/response/breed_response.dart';

abstract class RemoteDataSource {
  Future<List<BreedResponse>> getBreeds();
}