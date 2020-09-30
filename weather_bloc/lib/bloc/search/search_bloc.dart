import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_bloc/network/api_service.dart';
import 'package:weather_bloc/network/model/city_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  
  final ApiService api;
  SearchBloc({@required this.api}) : assert(api != null) ,  super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if(event is FetchCityDataEvent) {
      yield CityLoadingState();
      try{
        final response = await api.getCities(event.cityName);
        yield CityLoadedState(cityModels: response);
      }on SocketException catch(e){
        yield CityErrorState(e.toString());
      }on Exception catch(e){
        yield CityErrorState(e.toString());
      }
    }
  }
}
