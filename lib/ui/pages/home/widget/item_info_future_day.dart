import 'package:flutter/material.dart';

import '../../../../commons/app_icon.dart';
import '../../../../commons/app_text_styles.dart';
import '../../../../entities/consolidated_weather.dart';
import 'icon.dart';

class ItemFutureDay extends StatelessWidget {
  final ConsolidatedWeather data;
  const ItemFutureDay({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: 150,
      decoration: BoxDecoration(color: Colors.white30, borderRadius: const BorderRadius.all(Radius.circular(15)), border: Border.all(color: Colors.white, width: 1)),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: iconWeather(weatherStateAbbr: data.weatherStateAbbr ?? "") ,
              )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(bottom: 8),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: const BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        data.applicableDate?.substring(5,10) ?? "",
                        style: AppTextStyle.whiteS18,
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            /// The Temp Min-max
                            _buildIconAndInfo(title: data.minTemp.toString().substring(0,2), appIcons: AppIcons.iconTempLow),
                            _buildIconAndInfo(title: data.maxTemp.toString().substring(0,2), appIcons: AppIcons.iconTempHigh),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          /// the wind - humidity
                          _buildIconAndInfo(title: data.windSpeed.toString().substring(0,3), appIcons: AppIcons.iconWind),
                          _buildIconAndInfo(title: data.humidity.toString().substring(0,2), appIcons: AppIcons.iconHumidity),
                        ],
                      ))
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildIconAndInfo({String? title, Widget? appIcons, bool titleBorder = false}) {
    return titleBorder ? Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "",
                  style: AppTextStyle.whiteS15,
                ),
                const SizedBox(
                  width: 5,
                ),
                appIcons ?? const SizedBox(),
              ],
            )) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: AppTextStyle.whiteS18,
              ),
              const SizedBox(
                width: 5,
              ),
              appIcons ?? const SizedBox(),
            ],
          );
  }
}
