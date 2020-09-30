import 'package:bloc_recap/bloc/color/color_bloc.dart';
import 'package:bloc_recap/bloc/data/data_bloc.dart';
import 'package:bloc_recap/bloc/page/page_bloc.dart';
import 'package:bloc_recap/ui/my_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc> (
          create: (BuildContext context) => ColorBloc(),
        ),
        BlocProvider<PageBloc> (
          create: (BuildContext context) => PageBloc(),
        ),
        BlocProvider<DataBloc> (
          create: (BuildContext context) => DataBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Recap',
        home: MyHomePage(),
        theme: ThemeData(
          primaryColor: Colors.blueAccent
        ),
      ),
    );
  }
}
