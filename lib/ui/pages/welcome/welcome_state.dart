import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../entities/load_status.dart';
import '../../../entities/weather_repository.dart';

class WelcomeStatus{
  late Rx<WeatherRepository> weatherRepositoryResponse;
  final loadInit = LoadStatus.initial.obs;
  WelcomeStatus(){
    weatherRepositoryResponse = WeatherRepository().obs;
  }
}