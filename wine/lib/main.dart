import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wine/wine_detail.dart';
import 'models/wine_model.dart';

void main() {
  runApp(new MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wineBrands = wines;
  final recommendList = recommendWines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 2.0, blurRadius: 2.0),
                  ],
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                ),
              ),
              Positioned(
                top: 15.0,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () {},
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 50.0,
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            child: IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: Icon(Icons.notifications_none),
                              iconSize: 30.0,
                            ),
                          ),
                          Positioned(
                            top: 12.0,
                            left: 25.0,
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: new Text(
                                  '1',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontFamily: 'Raleway'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 20.0,
                    child: Column(
                      children: <Widget>[
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Boutique',
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                  fontSize: 33.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'More',
                              style: new TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Raleway',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          height: 275.0,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: wineBrands.map((wine) {
                                return _builtCard(wine);
                              }).toList()),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommend',
                    style: new TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More',
                    style: new TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Raleway',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 275.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                  recommendList.map((wine) {
                    return _builtCard(wine);
                  }).toList()
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _builtCard(wine) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => WineDetailPage(wineDetail: wine)
          )));
        },
          child: Container(
            width: 200.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: 2.0, blurRadius: 2.0),
                ]),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 160.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: wine.bgColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                  ),
                ),
                Hero(
                  tag: wine.imgPath,
                  child: Container(
                    height: 160.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      image: DecorationImage(
                          image: AssetImage(wine.imgPath), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        wine.price,
                        style: new TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17.0),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                        iconSize: 25.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 150.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          wine.title,
                          style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          wine.subTitle,
                          style: new TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            getRatingStar(wine.rating, 1),
                            getRatingStar(wine.rating, 2),
                            getRatingStar(wine.rating, 3),
                            getRatingStar(wine.rating, 4),
                            getRatingStar(wine.rating, 5),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              wine.rating.roundToDouble().toString(),
                              style: new TextStyle(
                                color: Colors.green,
                                fontSize: 17.0,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }

  getRatingStar(rating, index) {
    if (rating >= index) {
      return Icon(
        Icons.star,
        color: Colors.green,
        size: 14.0,
      );
    } else {
      return Icon(
        Icons.star,
        color: Colors.grey,
        size: 14.0,
      );
    }
  }
}
