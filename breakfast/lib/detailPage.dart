import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  const DetailPage({Key key, this.heroTag, this.foodName, this.foodPrice})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _counter = 0;
  double _result = 0.0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void total() {
    setState(() {
      _result = _counter * widget.foodPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300.0,
              ),
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage('images/fruits/jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 50.0,
                left: (MediaQuery.of(context).size.width / 2) - 125,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.more_horiz),
                  color: Colors.white,
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.foodName,
                  style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      fontSize: 45.0,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '4.5',
                      style: new TextStyle(
                          color: Colors.grey, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.green,
                      size: 15.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.foodPrice,
                      style: new TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFEDFEE5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              decrementCounter();
                            },
                            icon: Icon(Icons.remove_circle_outline),
                            iconSize: 25.0,
                            color: Color(0xFF5CB238),
                          ),
                          Text(
                            '$_counter',
                            style: new TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF5CB238),
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              onPressed: () {
                                incrementCounter();
                              },
                              icon: Icon(Icons.add_circle),
                              iconSize: 25.0,
                              color: Color(0xFF5AC035)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'About the food',
                        style: new TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'
                        ' It has survived not only five centuries, but also the leap into electronic typesetting',
                        style: new TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                            fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.green,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Total',
                              style: new TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 25.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '\$' + '$_result',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25.0),
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
        ],
      ),
    );
  }
}
