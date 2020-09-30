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
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 20.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        iconSize: 25.0,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        iconSize: 25.0,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0,),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Healthy ',
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0
                  ),
                ),
                Text(
                  'Food',
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 22.0
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0,),

          Container(
            height: MediaQuery.of(context).size.height - 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              color: Colors.white,
            ),
            child: ListView(
              primary: false,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 337.0,
                    child: ListView(
                      children: <Widget>[
                        _buildFoodItem('images/fruits.jpg', 'Fruits', '\$20.0'),
                        _buildFoodItem('images/cherry.jpg', 'Cherry', '\$14.0'),
                        _buildFoodItem('images/watermelon.jpg', 'Watermelon', '\$15.0'),
                        _buildFoodItem('images/lemon.jpg', 'Lemon', '\$19.0'),
                        _buildFoodItem('images/mango.jpg', 'Mango', '\$25.0'),
                        _buildFoodItem('images/pineapple.jpg', 'Pineapple', '\$18.0'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                        child: IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.shopping_basket),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                        child: Center(
                          child: new Text(
                            'Check Out',
                            style: new TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
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
    );
  }
  _buildFoodItem(String imgPath, String foodName, String price){
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(heroTag: imgPath, foodName: foodName, foodPrice: price,)
        ));
      },
       child: Container(

         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
               child: Row(
                 children: <Widget>[
                   Hero(
                     tag: imgPath,
                     child: Container(
                       height: 75.0,
                       width: 75.0,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(35.0),
                           boxShadow: [
                             BoxShadow(
                                 color: Colors.grey,
                                 spreadRadius: 0.3,
                                 blurRadius: 0.3
                             )
                           ],
                           image: DecorationImage(
                               image: AssetImage(imgPath),
                               fit: BoxFit.cover
                           )
                       ),
                     ),
                   ),
                   SizedBox(width: 40.0,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text(
                         foodName,
                         style: new TextStyle(
                           color: Colors.black,
                           fontFamily: 'Montserrat',
                           fontWeight: FontWeight.bold,
                           fontSize: 17.0,
                         ),
                       ),
                       Text(
                         price,
                         style: new TextStyle(
                           color: Colors.grey,
                           fontFamily: 'Montserrat',
                           fontWeight: FontWeight.bold,
                           fontSize: 15.0,
                         ),
                       ),
                     ],
                   ),

                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(right: 15.0),
               child: IconButton(
                 icon: Icon(Icons.add),
                 iconSize: 25.0,
                 color: Colors.black,
                 onPressed: () {},
               ),
             )

           ],

          ),
       ),
    );
  }
}

