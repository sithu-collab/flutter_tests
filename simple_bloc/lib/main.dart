import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/greeting_bloc.dart';
import 'package:simple_bloc/ui/bloc_home.dart';
import 'package:simple_bloc/ui/ephemeral_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Bloc Test";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GreetingBloc>(
      create: (context) => GreetingBloc(),
      child: MaterialApp(
        home: BlocHome(),
        title: _title,
      ),
    );
  }
}
