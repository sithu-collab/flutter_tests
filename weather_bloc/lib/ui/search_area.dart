import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_bloc/bloc/search/search_bloc.dart';
import 'package:weather_bloc/ui/weather_home.dart';

class SearchArea extends StatefulWidget {
  @override
  _SearchAreaState createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {

  TextEditingController _searchController = TextEditingController();


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search City',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.2,
                          blurRadius: 0.1
                        ),
                      ]
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.blueAccent, size: 25.0,),
                      onPressed: () {
                        if(_searchController.text != "") {
                          searchBloc..add(FetchCityDataEvent(cityName: _searchController.text));
                        }

                      },
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState> (
                builder: (context, state) {
                  if(state is CityLoadingState) {
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                  if(state is SearchInitial) {
                    return Center(
                      child: Text('Type Something to Search!',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: Colors.deepOrange,
                      textStyle: Theme.of(context).textTheme.headline6),),
                    );
                  }
                  if(state is CityLoadedState) {
                    return ListView.builder(
                      itemCount: state.cityModels.length,
                      itemBuilder: (BuildContext context, int index){
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => WeatherHome(cityCode: state.cityModels[index].woeId,)
                          ));
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0, bottom: 15.0),
                            child: Text('${state.cityModels[index].title}',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    textStyle: Theme.of(context).textTheme.headline6
                                )),
                          ),
                        ),
                      );
                    });
                  }
                  if(state is CityErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  return null;
                }
              )
            )
          ],

        ),
      ),
    );
  }
}
