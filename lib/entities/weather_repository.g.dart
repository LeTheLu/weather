// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRepository _$WeatherRepositoryFromJson(Map<String, dynamic> json) {
  return WeatherRepository(
    lsConsolidatedWeather: (json['consolidated_weather'] as List<dynamic>?)
        ?.map((e) => ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    locationType: json['location_type'] as String?,
    imageLink: json['sunRise'] as String?,
    sunRise: json['sun_rise'] as String?,
    sunSet: json['sun_set'] as String?,
    time: json['time'] as String?,
    timezone: json['timezone'] as String?,
  );
}

Map<String, dynamic> _$WeatherRepositoryToJson(WeatherRepository instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.lsConsolidatedWeather,
      'time': instance.time,
      'sun_rise': instance.sunRise,
      'sunRise': instance.imageLink,
      'sun_set': instance.sunSet,
      'title': instance.title,
      'location_type': instance.locationType,
      'timezone': instance.timezone,
    };
