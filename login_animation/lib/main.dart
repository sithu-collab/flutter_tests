import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'forgot_pass.dart';
void main(){
  runApp(new MaterialApp(
    routes: <String, WidgetBuilder>{
      '/sign_up' : (BuildContext context) => new SignUpPage(),
      '/forgot_pass' : (BuildContext context) => new ForgotPage()
    },
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation animation,delayAnimation,muchDelayAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,parent: animationController
    ));

    delayAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn), parent: animationController
    ));

    muchDelayAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),parent: animationController
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
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                          child: new Text('Hello',
                            style: new TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                          child: new Text('There',
                            style: new TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(250.0, 120.0, 0.0, 0.0),
                          child: new Text('.',
                            style: new TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: new InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: new TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: new InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: new TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Transform(
                  transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 10.0, right: 10.0),
                    alignment: Alignment(1.0,0.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/forgot_pass');
                      },
                      child: Text('Forgot Password',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.0),
                Transform(
                  transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text('LOGIN',
                            style: new TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Transform(
                  transform: Matrix4.translationValues(delayAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 50.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                            color: Colors.black12,
                            width: 2.0,
                            style: BorderStyle.solid
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image.asset('images/facebook_icon.png'),

                          ),
                          Center(
                            child: new Text('Log in with facebook',
                              style: new TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Transform(
                  transform: Matrix4.translationValues(muchDelayAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: new Text('New to Spotify?',
                            style: new TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/sign_up');
                          },
                          child: new Text('Register',
                            style: new TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
