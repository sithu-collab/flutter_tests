// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeathersModel _$WeathersModelFromJson(Map<String, dynamic> json) {
  return WeathersModel(
    json['title'] as String,
    json['location_type'] as String,
    json['woeid'] as int,
    json['latt_long'] as String,
    json['timezone'] as String,
    (json['consolidated_weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeathersModelToJson(WeathersModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeId,
      'latt_long': instance.latLong,
      'timezone': instance.timeZone,
      'consolidated_weather': instance.weathers,
    };
