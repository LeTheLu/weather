import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/weather_repository.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/api/location/1236594/")
  Future<WeatherRepository> initData();

}