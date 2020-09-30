import 'package:bloc_recap/bloc/color/color_bloc.dart';
import 'file:///D:/flutter%20projects/100DaysChallenge/bloc_recap/lib/ui/next_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Recap'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text('Red', style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)..add(ChangeColorEvent(Colors.red));
                  },
                ),
                FlatButton(
                  child: Text('Green', style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)..add(ChangeColorEvent(Colors.green));
                  },
                ),
                FlatButton(
                  child: Text('Blue', style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)..add(ChangeColorEvent(Colors.blue));
                  },
                ),
                FlatButton(
                  child: Text('Yellow', style: TextStyle(color: Colors.white),),
                  color: Colors.yellow,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)..add(ChangeColorEvent(Colors.yellow));
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ColorBloc, ColorState> (
              builder: (context, state) {
                Color _color = Colors.white;
                if(state is ChangeColorState) {
                  _color = state.color;
                }
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    color: _color,
                  );
              },
            )
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: FloatingActionButton(
              child: IconButton(icon: Icon(Icons.arrow_forward, color: Colors.white,),),
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NextPage()
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
