import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WineDetailPage extends StatefulWidget {
  final heroTag;
  final prodName;
  final prodType;
  final amount;
  final rating;

  const WineDetailPage({Key key, this.heroTag, this.prodName, this.prodType, this.amount, this.rating}) : super(key: key);

  @override
  _WineDetailPageState createState() => _WineDetailPageState();
}

class _WineDetailPageState extends State<WineDetailPage> {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(height: screenHeight, width: screenWidth,),
              Container(
                height: screenHeight / 3 + 40.0,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                ),
                child: Container(
                  height: screenHeight / 3 ,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.heroTag),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    Stack(
                      children: <Widget>[
                        Container(height: 50.0, width: 60.0,),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 25.0,
                          child: Container(
                            height: 15.0,
                            width: 15.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.5),
                                color: Colors.red
                            ),
                            child: Center(
                              child: Text('8',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),

              Positioned(
                top: screenHeight / 3 + 15.0,
                child: Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1.0,
                        blurRadius: 1.0
                      )
                    ],
                  ),
                     child: Padding(
                       padding: EdgeInsets.only(left: 20.0, top: 50.0),
                       child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text(widget.prodType,
                                 style: new TextStyle(
                                   color: Colors.black54,
                                   fontFamily: 'Raleway',
                                   fontSize: 16.0,
                                 ),),
                               SizedBox(height: 8.0,),
                               Text(widget.prodName,
                                 style: new TextStyle(
                                     color: Colors.black,
                                     fontFamily: 'Raleway',
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.bold
                                 ),),
                               SizedBox(height: 20.0,),
                               Row(
                                 children: <Widget>[
                                   _getRatingStar(widget.rating, 1),
                                   _getRatingStar(widget.rating, 2),
                                   _getRatingStar(widget.rating, 3),
                                   _getRatingStar(widget.rating, 4),
                                   _getRatingStar(widget.rating, 5),
                                   SizedBox(width: 10.0,),
                                   Text(
                                     widget.rating.roundToDouble().toString(),
                                     style: new TextStyle(
                                       color: Colors.amber,
                                       fontSize: 19.9,
                                       fontFamily: 'Raleway'
                                     ),
                                   )

                                 ],
                               )

                             ],
                           ),
                     ),
                ),
              ),
              Positioned(
                top: screenHeight / 3 + 50.0,
                right: 20.0,
                child: Hero(
                  tag: widget.heroTag,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(30 / 360),
                    child: Container(
                      height: 140.0,
                      width: 140.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70.0),
                          image: DecorationImage(
                              image: AssetImage(widget.heroTag),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight - 200.0,
                child: Container(
                  height: screenHeight - screenHeight / 3 - 50.0,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0.5,
                        blurRadius: 0.5
                      )
                    ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Text('Description',
                          style: new TextStyle(
                              color: Colors.black,
                              fontFamily: 'Raleway',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text('This' + widget.prodType + ' is very precious for your health and mind and it also a good present to pay your friends and share your loves',
                          style: new TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Raleway',
                              fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 60.0,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 0.4,
                                  blurRadius: 0.4
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Add to Cart',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Icon(
                                  Icons.shopping_cart,
                                  size: 25.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

        ],
      ),

      );
  }

   _getRatingStar(rating, int index) {
    if(rating >= index){
      return Icon(
        Icons.star,
        size: 15.0,
        color: Colors.amber,
      );
    }else{
      return Icon(
        Icons.star,
        size: 15.0,
        color: Colors.grey,
      );

    }
  }
}

