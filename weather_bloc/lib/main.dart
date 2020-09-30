import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_bloc/bloc/search/search_bloc.dart';
import 'package:weather_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_bloc/network/api_service.dart';
import 'package:weather_bloc/ui/weather_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title= 'Weather BLoC';
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc(api: apiService),
              ),
              BlocProvider<SearchBloc> (
                create: (context) => SearchBloc(api: apiService),
              )
            ],
            child: MaterialApp(
              title: _title,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: Colors.red
              ),
              home: WeatherHome(),
            ),
          );
        },
      ),
    );
  }
}
