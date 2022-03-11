import 'package:get/get.dart';
import 'package:weather/ui/pages/welcome/welcome_state.dart';
import 'package:intl/intl.dart';
import '../../../entities/load_status.dart';
import '../../../service/service.dart';

class WelcomeLogic extends GetxController{

  final state = WelcomeStatus();
  AuthService apiClient = Get.find();
  final dateStr = DateFormat('dd - MM - yyyy').format(DateTime.now());

  Future<bool> initData() async {
    state.loadInit.value = LoadStatus.loading;
    try{
      final result = await apiClient.initData();
      state.weatherRepositoryResponse.value = result;
      state.loadInit.value = LoadStatus.success;
      return true;
    }catch(e){
      state.loadInit.value = LoadStatus.failure;
      return false;
    }
  }
}