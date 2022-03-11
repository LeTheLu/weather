part of 'service.dart';

extension Api on AuthService{

  /// init Data
  Future<WeatherRepository> initData() async {
    return _apiClient.initData();
  }
}