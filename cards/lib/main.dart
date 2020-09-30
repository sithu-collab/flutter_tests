import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation cardAnimation, delayCardAnimation, fabAnimation, infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 3), vsync: this);

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
      CurvedAnimation(curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),parent: controller));

    fabAnimation = Tween(begin: 1.0, end: 0.008).animate(
      CurvedAnimation(curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),parent: controller));

    infoAnimation = Tween(begin: 0.0 , end: 0.025).animate(
      CurvedAnimation(curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),parent: controller));

  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return new AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child){
      return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: new IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,),
              onPressed: () {}),
          title: new Text('Near Me',
            style: new TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
            ),),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: FlutterLogo(
                size: 40.0,
                colors: Colors.blue,
              ),
            )
          ],
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    left: 20.0,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, delayCardAnimation.value * devHeight, 0.0),
                      width: 260.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
                      width: 280.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('images/girl.jpg',)
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15.0,
                    top: 320.0,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, infoAnimation.value * devHeight, 0.0),
                      width: 270.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              spreadRadius: 3.0,
                            )
                          ]
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Nora',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 4.0,),
                                Image.asset('images/female_symbol.png',
                                  height: 20.0,
                                  width: 20.0,
                                ),
                                SizedBox(width: 120.0,),
                                Text('5.6km',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 9.0,),
                            Row(
                              children: <Widget>[
                                Text('I\'m so emotional',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              transform: Matrix4.translationValues(0.0, fabAnimation.value * devHeight, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.0,
                            blurRadius: 1.0
                        )
                      ],
                      border: Border.all(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                      child: Center(
                        child: IconButton(
                          icon: Image.asset(('images/chat_bubble.png')),
                          color: Colors.lightBlueAccent,
                          onPressed: () {},
                        ),
                      ),
                    ),

                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

    });
  }
}
