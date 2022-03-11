import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:weather/commons/app_images.dart';

import '../../../entities/load_status.dart';
import '../../../entities/weather_repository.dart';
import 'package:intl/intl.dart';

class HomeState {
  late Rx<WeatherRepository> weatherRepositoryResponse;
  final loadInit = LoadStatus.initial.obs;
  final dateStr = DateFormat('EEEE  dd - MM - yyyy').format(DateTime.now()).obs;
  final time = (DateFormat('hh:mm:ss').format(DateTime.now())).obs;
  final urlBackground = AppImages.sunny1.obs;
  final min = 0.obs;

  HomeState(){
    weatherRepositoryResponse = WeatherRepository().obs;
  }
}