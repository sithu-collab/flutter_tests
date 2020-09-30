import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: PlantDetail(),
  ));
}

class PlantDetail extends StatefulWidget {
  final heroTag, type, name, price;

  const PlantDetail({Key key, this.heroTag, this.type, this.name, this.price}) : super(key: key);

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
       appBar: new AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0.0,
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           iconSize: 30.0,
           color: Colors.white,
           onPressed: () {
             Navigator.of(context).pop();
           },
         ),
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.shopping_cart),
             iconSize: 30.0,
             color: Colors.white,
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
         ],
       ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20.0),
                height: 320.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              widget.type,
                              style: new TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              widget.name,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'FROM',
                              style: new TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              widget.price,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'SIZES',
                              style: new TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Small',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.shopping_basket),
                            iconSize: 25.0,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                      Container(
                        padding: EdgeInsets.only(top: 120.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Hero(
                              tag: widget.heroTag,
                              child: Container(
                                height: 200.0,
                                width: 200.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    image: DecorationImage(
                                        image: AssetImage(widget.heroTag),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                  ],

                ),
              ),
            ],
          ),


          SizedBox(height: 20.0,),
          Stack(
            children: <Widget>[
              Container(

                height: MediaQuery.of(context).size.height - 210.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))
                ),
              ),
             Positioned(
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('All to know...',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),),
                      SizedBox(height: 10.0,),
                      Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                          'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: new TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontSize: 14.5,
                        ),),
                      SizedBox(height: 40.0,),
                      Text('Details',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),),
                      SizedBox(height: 10.0,),
                      Text('Plant height : 35 - 45cm;',
                        style: new TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                        ),),
                      SizedBox(height: 10.0,),
                      Text('Nursery pot width : 12cm;',
                        style: new TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                        ),),
                    ],
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}
