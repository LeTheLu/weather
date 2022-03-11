import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/commons/app_text_styles.dart';
import 'package:weather/commons/background.dart';
import 'package:weather/ui/pages/home/home_state.dart';
import 'package:weather/ui/pages/home/widget/icon.dart';
import 'package:weather/ui/pages/home/widget/info_location.dart';
import 'package:weather/ui/pages/home/widget/item_info_future_day.dart';

import 'package:intl/intl.dart';
import 'package:weather/utils/utils.dart';
import '../../../entities/weather_repository.dart';
import 'home_logic.dart';
import 'widget/progress.dart';

class HomePage extends StatefulWidget {
  final WeatherRepository data;

  const HomePage({Key? key, required this.data}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  late Timer countTimerToCallApi;
  late Timer countTimer;
  late Timer countTimerDay;

  @override
  void initState() {
    state.weatherRepositoryResponse.value = widget.data;
    super.initState();
    reCallApiInit();
    setBackgroundInit();
    setTime();
    setDay();
  }

  void reCallApiInit() {
    countTimerToCallApi = Timer.periodic(const Duration(minutes: 5), (Timer t) {
      logic.initData();
    });
  }

  void setDay() {
    countTimerDay = Timer.periodic(const Duration(days: 1), (Timer t) {
      logic.updateDay();
    });
  }

  void setTime() {
    String hour = DateFormat('HH').format(DateTime.now());

    countTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      logic.updateSecond();
      if(hour != state.time.value.substring(0, 2)){
        final image = Utils.getBackground(hour: state.time.value.substring(0, 2));
        logic.updateBackground(imageLink: image);
      }
    });
  }

  setBackgroundInit(){
    String hour = DateFormat('HH').format(DateTime.now());
    Utils.getBackground(hour: hour);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Background(
        urlImgBackground: state.urlBackground.value,
        widgetBody: _widgetBody(),
      );
    });
  }

  Widget _widgetBody() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        /// Location
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              return Text(state.dateStr.value, style: AppTextStyle.whiteS15ComForTaa);
            }),
            const SizedBox(height: 15),
            Text(state.weatherRepositoryResponse.value.title ?? "", style: AppTextStyle.whiteS40),
            const SizedBox(height: 15),

            /// info location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((state.weatherRepositoryResponse.value.lsConsolidatedWeather?.first.theTemp.toString().substring(0, 2) ?? "") + " độ", style: AppTextStyle.whiteS20),
                const SizedBox(width: 10),
                //AppIcons.iconRain,
                SizedBox(height: 25, width: 25, child: iconWeather(weatherStateAbbr: state.weatherRepositoryResponse.value.lsConsolidatedWeather?.first.weatherStateAbbr ?? ''))
              ],
            ),
            const SizedBox(height: 20),
            InfoLocation(
              maxTemp: state.weatherRepositoryResponse.value.lsConsolidatedWeather?.first.maxTemp.toString().substring(0, 2) ?? '',
              minTemp: state.weatherRepositoryResponse.value.lsConsolidatedWeather?.first.minTemp.toString().substring(0, 2) ?? '',
              humidity: state.weatherRepositoryResponse.value.lsConsolidatedWeather?.first.humidity.toString().substring(0, 2) ?? '',
              sunRise: (state.weatherRepositoryResponse.value.sunRise?.substring(11, 16) ?? '') + " am",
              sunSet: (state.weatherRepositoryResponse.value.sunSet?.substring(11, 16) ?? '') + " pm",
              wind: state.weatherRepositoryResponse.value.lsConsolidatedWeather?.first.windSpeed.toString().substring(0, 3) ?? '',
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// forecast
        // state.weatherRepositoryResponse.value.lsConsolidatedWeather != []
        //     ? SizedBox(
        //         height: 200,
        //         child: ListView.separated(
        //           scrollDirection: Axis.horizontal,
        //           shrinkWrap: true,
        //           itemCount: 5,
        //           itemBuilder: (context, index) => ItemFutureDay(data: state.weatherRepositoryResponse.value.lsConsolidatedWeather![index]),
        //           separatorBuilder: (context, index) => const SizedBox(width: 10),
        //         ),
        //       )
        //     : const SizedBox(),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => ItemFutureDay(data: state.weatherRepositoryResponse.value.lsConsolidatedWeather![index]),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),

        const SizedBox(height: 20),

        Obx(() {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            height: 65,
            decoration: BoxDecoration(color: Colors.white30, borderRadius: const BorderRadius.all(Radius.circular(15)), border: Border.all(width: 1, color: Colors.white)),
            child: Text(
              state.time.value,
              style: AppTextStyle.whiteS20ComForTaa,
            ),
          );
        }),
        const SizedBox(height: 20),
        //ProgressBar(min: state.min.value),
        const SizedBox(height: 100),
      ]),
    );
  }
}
