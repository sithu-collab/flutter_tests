part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}


class FetchWeatherData extends WeatherEvent {
  final int cityCode;

  FetchWeatherData({@required this.cityCode}) : assert (cityCode != null);

  @override
  // TODO: implement props
  List<Object> get props => [cityCode];
}