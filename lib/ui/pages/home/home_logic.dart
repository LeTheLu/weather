import 'package:get/get.dart';
import 'package:weather/entities/load_status.dart';
import 'package:weather/ui/pages/home/home_state.dart';

import '../../../service/service.dart';
import 'package:intl/intl.dart';

class HomeLogic extends GetxController{
  final state = HomeState();
  AuthService apiClient = Get.find();

  void initData() async {
    state.loadInit.value = LoadStatus.loading;
    try{
      final result = await apiClient.initData();
      state.weatherRepositoryResponse.value = result;
      state.loadInit.value = LoadStatus.success;
    }catch(e){
      state.loadInit.value = LoadStatus.failure;
    }
  }

  void updateSecond() {
    final now = DateTime.now();
   final currentTime  =  (DateFormat('HH:mm:ss').format(now));
    state.time.value = currentTime;
    state.min.value = now.second;
  }

  void updateDay() {
    final dateStr = DateFormat('EEEE  dd - MM - yyyy').format(DateTime.now());
    state.dateStr.value = dateStr;
  }
  void updateBackground({String ?imageLink}) {
    state.urlBackground.value = imageLink ?? '';
  }
}