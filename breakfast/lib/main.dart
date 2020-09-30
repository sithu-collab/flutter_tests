import 'package:flutter/material.dart';

import 'detailPage.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/cherry.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Good',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      color: Colors.green),
                ),
                Text(
                  'Morning',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Popular Food',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildFoodCard('images/pineapple.jpg', 'Watermelon', '\$0.78'),
                _buildFoodCard('images/blueberry.jpg', 'Blueberry ', '\$0.76'),
                _buildFoodCard('images/lemon.jpg', 'lemon ', '\$0.76'),
                _buildFoodCard('images/mango.jpg', 'mango ', '\$0.76'),
                _buildFoodCard('images/pineapple.jpg', 'pineapple ', '\$0.76'),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: new Text(
              'Best Food',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _bestFoodCard('images/cherry.jpg'),
                _bestFoodCard('images/lemon.jpg'),
                _bestFoodCard('images/pineapple.jpg'),
                _bestFoodCard('images/mango.jpg'),
                _bestFoodCard('images/orange.jpg'),
                _bestFoodCard('images/watermelon.jpg'),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          color: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.bookmark_border,
              color: Colors.white,
              size: 30.0,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30.0,
            ),
            Icon(
              Icons.shopping_basket,
              color: Colors.white,
              size: 30.0,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  _bestFoodCard(String image) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFACBEA3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 1.0, blurRadius: 1.0)
              ],
              borderRadius: BorderRadius.circular(15.0),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
      ),
    );
  }

  _buildFoodCard(String imgPath, String foodName, String price) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
            builder: (context) => DetailPage(
                heroTag: imgPath, foodName: foodName, foodPrice: price))));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 5.0),
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 1.0,
                  spreadRadius: 1.0),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 175.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFACBEA3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 175.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                  ),
                ),
              ),
              Positioned(
                top: 160.0,
                right: 20.0,
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Center(
                        child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 18.0,
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         spreadRadius: 1.0,
//                         blurRadius: 1.0
//                       ),
//                     ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          color: Colors.black),
                    ),
                    Container(
                      width: 175.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
