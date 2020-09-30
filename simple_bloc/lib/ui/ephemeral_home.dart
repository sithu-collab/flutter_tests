import 'package:flutter/material.dart';

class EphemeralHome extends StatefulWidget {
  @override
  _EphemeralHomeState createState() => _EphemeralHomeState();
}

class _EphemeralHomeState extends State<EphemeralHome> {
  static const String _title = 'Bloc Test';

  String _greeting = 'Hello World';

  void _changeGreet(String greet) {
    setState(() {
      _greeting = greet;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Text(_greeting,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Howdy', style: TextStyle(color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: () {
                      _changeGreet('Howdy');
                    },
                  ),
                  FlatButton(
                    child: Text('What\'s up', style: TextStyle(color: Colors.white),),
                    color: Colors.red,
                    onPressed: () {
                      _changeGreet('What\'s up');
                    },
                  ),
                  FlatButton(
                    child: Text('You\'re Rock', style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      _changeGreet('You\'re Rock');
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}
