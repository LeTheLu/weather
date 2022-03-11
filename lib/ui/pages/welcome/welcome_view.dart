import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/commons/app_colors.dart';
import 'package:weather/commons/app_images.dart';
import 'package:weather/entities/load_status.dart';
import 'package:weather/ui/pages/welcome/welcome_logic.dart';
import 'package:weather/ui/pages/welcome/welcome_state.dart';

import '../home/home_view.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  final WelcomeLogic logic = Get.put(WelcomeLogic());
  final WelcomeStatus state = Get.find<WelcomeLogic>().state;

  @override
  void initState() {
    super.initState();
    callDataToHome();
  }

  void callDataToHome() async {
    bool result = await logic.initData();
    if (result) {
      Get.to(HomePage(data: state.weatherRepositoryResponse.value,));
    }
    else {
      state.loadInit.value = LoadStatus.failure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.main,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.fHome),
            //RaisedButton(onPressed:() => Get.to(HomePage(data: state.weatherRepositoryResponse.value,)))
          ],
        )
    );
  }
}
