import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc/network/model/weather_model.dart';


part 'weathers_model.g.dart';
@JsonSerializable()
class WeathersModel extends Equatable{
  final String title;
  @JsonKey(name: 'location_type')
  final String locationType;
  @JsonKey(name: 'woeid')
  final int woeId;
  @JsonKey(name: 'latt_long')
  final String latLong;
  @JsonKey(name: 'timezone')
  final String timeZone;
  @JsonKey(name: 'consolidated_weather')
  final List<WeatherModel> weathers;

  WeathersModel(
      this.title, this.locationType, this.woeId, this.latLong, this.timeZone, this.weathers);

  factory WeathersModel.fromJson(Map<String, dynamic> json) => _$WeathersModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeathersModelToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [title, locationType, woeId, latLong, timeZone, weathers];
}