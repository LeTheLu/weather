import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';

@JsonSerializable()
class ConsolidatedWeather {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "weather_state_name")
  final String? weatherStateName;
  @JsonKey(name: "weather_state_abbr")
  final String? weatherStateAbbr;
  @JsonKey(name: "wind_direction_compass")
  final String? windDirectionCompass;
  @JsonKey(name: "created")
  final String? created;
  @JsonKey(name: "applicable_date")
  final String? applicableDate;
  @JsonKey(name: "min_temp")
  final double? minTemp;
  @JsonKey(name: "max_temp")
  final double? maxTemp;
  @JsonKey(name: "the_temp")
  final double? theTemp;
  @JsonKey(name: "wind_speed")
  final double? windSpeed;
  @JsonKey(name: "wind_direction")
  final double? windDirection;
  @JsonKey(name: "air_pressure")
  final double? airPressure;
  @JsonKey(name: "humidity")
  final int? humidity;
  @JsonKey(name: "visibility")
  final double? visibility;
  @JsonKey(name: "predictability")
  final int? predictability;


  ConsolidatedWeather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.airPressure,
    this.applicableDate,
    this.humidity,
    this.maxTemp,
    this.minTemp,
    this.predictability,
    this.theTemp,
    this.visibility,
    this.windDirection,
    this.windSpeed,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}