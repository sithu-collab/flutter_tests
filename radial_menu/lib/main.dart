import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(new MaterialApp(
    home: MyHomePage(),
    title: 'Radial Menu',
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool opened = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Radial Menu'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: new Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 - 40.0
                : MediaQuery.of(context).size.width/ 2 - 150.0,
            top: (MediaQuery.of(context).size.height / 2) - 60.0,
            child: _buildOption(
                Icon(
                  FontAwesome.glass,
                  color: Colors.white,
                ),
                Colors.purple),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 - 20.0
                : MediaQuery.of(context).size.width/ 2 + 120.0,
            top: (MediaQuery.of(context).size.height / 2) - 68.0,
            child: _buildOption(
                Icon(
                  FontAwesome.glass,
                  color: Colors.white,
                ),
                Colors.purple),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: opened
                  ? InkWell(
                      key: UniqueKey(),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.blue),
                          child: new Center(
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          opened = false;
                        });
                      })
                  : InkWell(
                      key: UniqueKey(),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.red),
                          child: new Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          opened = true;
                        });
                      }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOption(Icon icon, Color iconColor) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return RotationTransition(
          child: child,
          turns: animation,
        );
      },
      child: InkWell(
        key: UniqueKey(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: new Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), color: iconColor),
            child: Center(
              child: icon,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            opened = false;
          });
        },
      ),
    );
  }
}
