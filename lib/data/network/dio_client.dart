import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String xApiKey = 'x-api-key';
const String xApiKeyValue = 'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';


Future<Dio> getDio() async {
  final dio = Dio();
  Duration timeOut = const Duration(milliseconds: 6000);

  Map<String, String> headers = {
    contentType: applicationJson,
    accept: applicationJson,
    xApiKey: xApiKeyValue
  };

  dio.options = BaseOptions(
      baseUrl: 'https://api.thecatapi.com/',
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers);
  if (!kReleaseMode) {
    dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true));
  }

  return dio;
}
