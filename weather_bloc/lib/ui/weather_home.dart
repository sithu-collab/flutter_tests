import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_bloc/ui/search_area.dart';
import 'package:weather_bloc/util/my_helper.dart';

class WeatherHome extends StatefulWidget {
  final int cityCode;

  WeatherHome({this.cityCode = 2487956});

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  static const String _title = 'Weather BLoC';

  @override
  Widget build(BuildContext context) {

    final newFormat = DateFormat("dd/MM/yy H:m:s");
    // ignore: close_sinks
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc..add(FetchWeatherData(cityCode: widget.cityCode));
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white,), onPressed: () {},),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SearchArea()
              ));
            },
            tooltip: 'Search City',
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: 20.0, top: 20.0, right: 20.0, bottom: 30.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is LoadingWeatherState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is ErrorState) {
                return Center(
                  child: Text('Error Loading From API'),
                );
              }
              if (state is LoadedWeatherState) {
                return ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('${state.weathersModel.title}',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .headline2
                            )),
                        SizedBox(height: 30.0,),
                        Text('updated: ' + newFormat.format(DateTime.parse(state.weathersModel.weathers[0].created)).toString()),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Image(
                            width: 150.0,
                            image: AssetImage('assets/images/${MyHelper.mapEventToImage(state.weathersModel.weathers[0].weatherStateAbbr)}.png'),
                          ),
                        ),

                        Text('${state.weathersModel.weathers[0].weatherStateName}',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .headline5
                            )),
                        SizedBox(height: 30.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('${state.weathersModel.weathers[0].theTemp.toInt()}°C',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[600],
                                    textStyle: Theme
                                        .of(context)
                                        .textTheme
                                        .headline3
                                )),
                            Column(
                              children: <Widget>[
                                Text('min: ${state.weathersModel.weathers[0].minTemp.toInt()}°C'),
                                Text('max: ${state.weathersModel.weathers[0].maxTemp.toInt()}°C'),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                );
              }
              return null;
            }
        ),
      ),
    );
  }
}
