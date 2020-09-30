import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_bloc/bloc/greeting_bloc.dart';

class BlocHome extends StatelessWidget {
  static const String _title = "Bloc Test";
  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final bloc = BlocProvider.of<GreetingBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DisplayWidget(),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Howdy', style: TextStyle(color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: () {
                      bloc..add(HowdyEvent());
                    },
                  ),
                  FlatButton(
                    child: Text('What\'s up', style: TextStyle(color: Colors.white),),
                    color: Colors.red,
                    onPressed: () {
                      bloc..add(WhatUpEvent());
                    },
                  ),
                  FlatButton(
                    child: Text('You\'re Rock', style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      bloc..add(YouAreRockEvent());
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _greet;
    return BlocBuilder<GreetingBloc, GreetingState> (
      builder: (context, state) {
        if(state is InitialGreetingState) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          );
        }
        if(state is HowdyState) {
          _greet = state.greeting;
        }
        if(state is WhatUpState) {
          _greet = state.greeting;
        }
        if(state is YouAreRockState) {
          _greet = state.greeting;
        }
        if(state is ErrorState) {
          return Container(
            child: Text('Error', style: GoogleFonts.aladin(fontSize: 25.0),),
          );
        }
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Text(_greet,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
        );
      },
    );

  }
}
