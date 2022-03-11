// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidated_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    id: json['id'] as int?,
    weatherStateName: json['weather_state_name'] as String?,
    weatherStateAbbr: json['weather_state_abbr'] as String?,
    windDirectionCompass: json['wind_direction_compass'] as String?,
    created: json['created'] as String?,
    airPressure: (json['air_pressure'] as num?)?.toDouble(),
    applicableDate: json['applicable_date'] as String?,
    humidity: json['humidity'] as int?,
    maxTemp: (json['max_temp'] as num?)?.toDouble(),
    minTemp: (json['min_temp'] as num?)?.toDouble(),
    predictability: json['predictability'] as int?,
    theTemp: (json['the_temp'] as num?)?.toDouble(),
    visibility: (json['visibility'] as num?)?.toDouble(),
    windDirection: (json['wind_direction'] as num?)?.toDouble(),
    windSpeed: (json['wind_speed'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created,
      'applicable_date': instance.applicableDate,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };
