import 'package:flutter/material.dart';
void main() {
  runApp(new MaterialApp(
    routes: <String, WidgetBuilder>{
    },
    home: SignUpPage(),
  ));
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin{
  Animation animation, delayAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn, parent: animationController
    ));

    delayAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn), parent: animationController
    ));
  }
  @override
    Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                child: Container(
                  child: new Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                        child: new Text(
                          'Signup',
                          style: new TextStyle(
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(265.0, 60.0, 0.0, 0.0),
                        child: new Text(
                          '.',
                          style: new TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Transform(
                transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                        child: new TextField(
                          decoration: new InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: new TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),

                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                        child: new TextField(
                          decoration: new InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: new TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                        child: new TextField(
                          decoration: new InputDecoration(
                            labelText: 'CONFIRM PASSWORD',
                            labelStyle: new TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.0,),
              Transform(
                transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  height: 50.0,
                  child: Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.green,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: new Center(
                        child: new Text(
                          'SIGN UP',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0,),
              Transform(
                transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                child: Container(
                  height: 50.0,
                  color: Colors.transparent,
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                          style: BorderStyle.solid
                      ),

                    ),
                    child: new Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: new Text(
                          'Go Back',
                          style: new TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
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
      },
    );
  }
}
