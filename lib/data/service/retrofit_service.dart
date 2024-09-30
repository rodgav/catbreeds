import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:thecat_rodgav/data/response/breed_response.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) = _RetrofitService;

  @GET('/v1/breeds?limit=10&page=0')
  Future<List<BreedResponse>> getBreeds();
}
