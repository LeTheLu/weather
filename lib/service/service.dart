import 'package:get/get.dart';

import '../entities/weather_repository.dart';
import '../network/api_client.dart';
import '../network/api_util.dart';


part 'api.dart';

class AuthService extends GetxService {
  late ApiClient _apiClient;

  Future<AuthService> init() async {
    _apiClient = await ApiUtil.getApiClient();
    return this;
  }

  void refreshApiClient() async {
    _apiClient = await ApiUtil.getApiClient();
  }
}