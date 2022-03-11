import 'package:dio/dio.dart';

import 'api_client.dart';
import 'api_interceptors.dart';

class ApiUtil {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = 300000;
      dio!.interceptors.add(ApiInterceptors());
    }
    return dio!;
  }

  static Future<ApiClient> getApiClient() async {
    final apiClient = ApiClient(getDio(), baseUrl: "https://www.metaweather.com");
    return apiClient;
  }

  /// Convert dio errors to Strings
  static String errorToString(dynamic e) {
    try {
      if (e is DioError) {
        if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout) {
          return 'Connection error has occurred';
        }
        if (e.response?.data is Map<String, dynamic>) {
          if (e.response?.data['message'] != null) {
            return e.response?.data['message'];
          }
        }
        int statusCode = e.response!.statusCode!;
        if (statusCode != null && statusCode > 500) {
          return 'System error';
        }
      }
    } catch (e) {
      return 'System error';
    }
    return 'System error';
  }
}
