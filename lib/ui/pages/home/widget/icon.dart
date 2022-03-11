import 'package:flutter/cupertino.dart';

Widget iconWeather({required String weatherStateAbbr}){
  return Image.network("https://www.metaweather.com/static/img/weather/png/$weatherStateAbbr.png");
}