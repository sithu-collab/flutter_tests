import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: ForgotPage(),
  ));
}

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: new Text(
                  'This is forgot password page',
                  style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.green
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 40.0,),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            height: 50.0,
            child: Material(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.green,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: new Text(
                      'Go Back',
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            height: 50.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid
                )
              ),
              child: Container(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Text(
                      'Go Back',
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
