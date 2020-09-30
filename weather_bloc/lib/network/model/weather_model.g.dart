// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    json['weather_state_name'] as String,
    json['weather_state_abbr'] as String,
    json['created'] as String,
    (json['min_temp'] as num)?.toDouble(),
    (json['max_temp'] as num)?.toDouble(),
    (json['the_temp'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'created': instance.created,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
    };
