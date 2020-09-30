import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
        title: 'Division Test',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Division Test'),
          ),
          body: MessagingDisplayDivision(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MessagingDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.green.shade800,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text('Lorem ipsum is loaded coming soon!',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 23.0),),

            ),
          ),
        ),
      );
  }
}

class MessagingDisplayDivision extends StatefulWidget {
  @override
  _MessagingDisplayDivisionState createState() => _MessagingDisplayDivisionState();
}

class _MessagingDisplayDivisionState extends State<MessagingDisplayDivision> {
  bool pressed = true;
  final TxtStyle contentStyle = TxtStyle()
    ..bold()
    ..textColor(Colors.white)
    ..alignment.center()
    ..italic()
    ..fontSize(22.0)
    ..textAlign.start();

  final ParentStyle containerStyle = ParentStyle(angleFormat: AngleFormat.degree)
    ..alignment.center()
    ..width(350.0)
    ..height(200.0)
    ..padding(all: 20.0)
    ..ripple(true, splashColor: Colors.grey.withOpacity(0.2))
    ..borderRadius(all: 8.0)
    ..animate(100, Curves.decelerate)
    ;


  Gestures cardGestures() => Gestures()
    ..isTap((isPressed) => setState(() => pressed = isPressed));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Parent(
          child: Container(
            child: Txt('Lorem ipsum is loaded coming soon!',
            style: contentStyle
            ),
          ),
          style: containerStyle.clone()
          ..background.color(pressed ? Colors.green : Colors.red)
            ..scale(pressed ? 1 : 1.1)
            ..elevation(pressed ? 3.0 : 10.0)
            ..rotate(pressed ? 0.0 : -10.0),
          gesture: cardGestures(),
      ),
    );
  }
}

