import 'package:flutter/material.dart';

import '../../../../commons/app_icon.dart';
import '../../../../commons/app_text_styles.dart';


class InfoLocation extends StatelessWidget {
  final String maxTemp;
  final String minTemp;
  final String wind;
  final String humidity;
  final String sunSet;
  final String sunRise;
  const InfoLocation({Key? key, this.maxTemp = "", this.minTemp = "", this.wind = "", this.humidity = "", this.sunSet = "", this.sunRise = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin : const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(width: 1, color: Colors.white)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// temp min - max
          Row(
            children: [
              _buildIconAndInfo(title: minTemp,appIcons: AppIcons.iconTempLow),
                const SizedBox(width : 10,),
              _buildIconAndInfo(title: maxTemp,appIcons: AppIcons.iconTempHigh),
            ],
          ),


          Row(
            children: [
              /// Wind
              _buildIconAndInfo(title: wind,appIcons: AppIcons.iconWind,),
              ///Humidity
              const SizedBox(width : 10,),
              _buildIconAndInfo(title: humidity,appIcons: AppIcons.iconHumidity),
            ],
          ),

          /// Sun set-rise
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildIconAndInfo(title: sunRise,appIcons: AppIcons.iconSunset, titleBorder: true),
              const SizedBox(height: 3,),
              _buildIconAndInfo(title: sunSet,appIcons: AppIcons.iconMoon, titleBorder: true),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildIconAndInfo({String? title, Widget? appIcons, bool titleBorder = false}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        titleBorder ? Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
            child: Text(title ?? "", style: AppTextStyle.whiteS15,))
            : Text(title ?? "", style: AppTextStyle.whiteS18,),
        const SizedBox(width: 8,),
        appIcons ?? const SizedBox(),
      ],
    );
  }
}
