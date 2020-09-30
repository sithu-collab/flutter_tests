import 'package:flutter/material.dart';

class WineDetailPage extends StatefulWidget {
  final wineDetail;

  const WineDetailPage({Key key, this.wineDetail}) : super(key: key);
  @override
  _WineDetailPageState createState() => _WineDetailPageState();
}

class _WineDetailPageState extends State<WineDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
         Stack(
            children: <Widget>[
              Container(
                height: 450.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2.0,
                          blurRadius: 2.0
                      ),
                    ]
                ),
              ),
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1.0,
                          blurRadius: 0.3
                      )
                    ]
                ),
              ),
              Positioned(
                top: 15.0,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                top: 60.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 70.0),
                  child: Hero(
                    tag: widget.wineDetail.imgPath,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(30/360),
                        child: Container(
                          height: 200.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0
                            ),
                            image: DecorationImage(
                                image: AssetImage(widget.wineDetail.imgPath),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),

                  ),
                ),
              ),
              Positioned(
                top: 320,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.wineDetail.title,
                        style: new TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        widget.wineDetail.subTitle,
                        style: new TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                        ),
                      ),
                      SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              )

            ],
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Description',
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    'This is the famous wine in the world! You should try it and I\'m surely that you\'ll like it.',
                    style: new TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Raleway',
                        fontSize: 17.0
                    ),
                  ),
                ],

              ),
            ),
          )

        ],
      ),
    );
  }
}
