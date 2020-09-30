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
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                height: 500.0,
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
                height: 350.0,
                decoration: BoxDecoration(
                    color: widget.wineDetail.bgColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2.0,
                          blurRadius: 2.0
                      )
                    ]
                ),
              ),
              Positioned(
                top: 15.0,
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
                top: 45.0,
                left: 15.0,
                right: 15.0,
                child: Hero(
                  tag: widget.wineDetail.imgPath,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(20/360),
                    child: Container(
                      height: 250.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.wineDetail.imgPath),
                          fit: BoxFit.contain
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
