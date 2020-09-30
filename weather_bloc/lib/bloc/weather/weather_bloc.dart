import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_bloc/network/api_service.dart';
import 'package:weather_bloc/network/model/weathers_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final ApiService api;
  WeatherBloc({@required this.api}) : assert(api != null) , super(WeatherInitial());
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeatherData) {
      yield LoadingWeatherState();
      try{
        final response = await api.getWeather(event.cityCode);
        yield LoadedWeatherState(weathersModel: response);
      }on SocketException {
        yield ErrorState();
      }on Exception {
        yield ErrorState();
      }
    }
  }
}
