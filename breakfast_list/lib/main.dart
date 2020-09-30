import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
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
          SizedBox(height: 10.0,),
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
                    color: Colors.green
                  ),
                ),
                Text(
                  'Morning',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      color: Colors.green
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Popular Food',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),

          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                    _buildFoodCard('images/watermelon.jpg', 'Watermelon Breakfast', '\$0.78'),
                    _buildFoodCard('images/blueberry.jpg', 'Blueberry Breakfast', '\$0.76'),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            height: 200.0,
            padding: EdgeInsets.only(left: 20.0),
            child: new Text(
              'Best Food',
              style: new TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.grey.withOpacity(5.0)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              image: DecorationImage(
                image: AssetImage('images/fruits.jpg'),
                fit: BoxFit.contain,
              )
            ),
          )

        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.0),
        height: 75.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0)),
          color: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.bookmark_border, color: Colors.white, size: 20.0,),
            Icon(Icons.search, color: Colors.white, size: 20.0,),
            Icon(Icons.shopping_basket, color: Colors.white, size: 20.0,),
            Icon(Icons.person_outline, color: Colors.white, size: 20.0,),

          ],
        ),



      ),
    );
  }

  _buildFoodCard(String imgPath, String foodName, String price){
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
          ),

         child: Stack(
           children: <Widget>[
             Container(
               padding: EdgeInsets.all(15.0),
               height: 175.0,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 gradient: LinearGradient(
                     colors: [Colors.white, Colors.white30],
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight
                 ),
               ),
             ),
             Hero(
               tag: imgPath,
               child: Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(imgPath),
                     fit: BoxFit.contain
                   ),
                   borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),
                   topLeft: Radius.circular(10.0))
                 ),
               ),
             ),
             Positioned(
               height: 160.0,
               right: 20.0,
               child: Material(
                 elevation: 2.0,
                 borderRadius: BorderRadius.circular(15.0),
                 child: Container(
                   height: 30.0,
                   width: 30.0,
                   child: Center(
                       child: Icon(Icons.favorite, color: Colors.red, size: 18.0,)),
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
               height: 190.0,
               left: 10.0,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     foodName,
                     style: TextStyle(
                         fontFamily: 'Montserrat',
                         fontSize: 16.0,
                         color: Colors.black
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Text(
                             '4.5',
                             style: TextStyle(
                                 fontFamily: 'Montserrat',
                                 color: Colors.green
                             ),
                           ),
                           SizedBox(width: 4.0,),

                           Icon(Icons.star, color: Colors.yellow, size: 15.0,),
                           Icon(Icons.star, color: Colors.yellow, size: 15.0,),
                           Icon(Icons.star, color: Colors.yellow, size: 15.0,),
                           Icon(Icons.star, color: Colors.yellow, size: 15.0,),
                           Icon(Icons.star_half, color: Colors.yellow, size: 15.0,),

                         ],

                       ),
                       SizedBox(width: 10.0,),
                       Text(
                         price,
                         style: TextStyle(
                             fontFamily: 'Montserrat',
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0,
                             color: Colors.green
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             )

           ],
         ),
        ),

      )
    );
  }
}
