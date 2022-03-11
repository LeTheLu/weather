import 'dart:convert';

import 'package:dio/dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;
    if (method == 'GET') {
      print("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}");
    } else {
      try {
        print("✈️ REQUEST[$method] => PATH: $uri \n DATA: ${jsonEncode(data)}");
      } catch (e) {
        print(
          "✈️ REQUEST[$method] => PATH: $uri \n \n DATA: $data",
        );
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = response.data;
    print("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    // if (response.data is String) {
    //   var jsonData = json.decode(response.data);
    //   var jsonResponse = response;
    //   jsonResponse.data = jsonData;
    //   return super.onResponse(response, handler);
    // }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    print("⚠️ ERROR[$statusCode] => PATH: $uri");
    return super.onError(err, handler);
  }
}
