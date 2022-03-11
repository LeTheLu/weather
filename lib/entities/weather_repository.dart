import 'package:json_annotation/json_annotation.dart';

import 'consolidated_weather.dart';

part 'weather_repository.g.dart';

@JsonSerializable()
class WeatherRepository {
  @JsonKey(name: "consolidated_weather")
  final List<ConsolidatedWeather>? lsConsolidatedWeather;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "sun_rise")
  final String? sunRise;
  @JsonKey(name: "sunRise")
  final String? imageLink;
  @JsonKey(name: "sun_set")
  final String? sunSet;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "location_type")
  final String? locationType;
  @JsonKey(name: "timezone")
  final String? timezone;

  WeatherRepository({
    this.lsConsolidatedWeather,
    this.title,
    this.locationType,
    this.imageLink,
    this.sunRise,
    this.sunSet,
    this.time,
    this.timezone
  });

  factory WeatherRepository.fromJson(Map<String, dynamic> json) => _$WeatherRepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRepositoryToJson(this);
}