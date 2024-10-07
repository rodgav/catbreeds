import 'package:thecat_rodgav/data/datasource/remote_datasource.dart';
import 'package:thecat_rodgav/data/response/breed_response.dart';
import 'package:thecat_rodgav/data/service/retrofit_service.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final RetrofitService _retrofitService;

  RemoteDataSourceImpl(this._retrofitService);

  @override
  Future<List<BreedResponse>> getBreeds(int page) async {
    Map<String, dynamic> queries = {'limit': '10', 'page': page.toString()};
    return _retrofitService.getBreeds(queries);
  }

  @override
  Future<BreedResponse> getBreed(String breedId) =>
      _retrofitService.getBreed(breedId);
}
