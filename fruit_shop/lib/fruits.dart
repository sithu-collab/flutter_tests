import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: FruitsPage(),
  ));
}
class FruitsPage extends StatefulWidget {
  @override
  _FruitsPageState createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                getFoodCard('images/cherry.jpg', 'Cherry', '0.57', true),
                getFoodCard('images/blueberry.jpg', 'Blueberry', '0.47', false),
                getFoodCard('images/mango.jpg', 'Mango', '0.69', true)
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                getFoodCard('images/fruits.jpg', 'Mango', '0.93', false),
                getFoodCard('images/watermalon.jpg', 'Watermelon', '0.57', true),
                getFoodCard('images/orange.jpg', 'Orange', '0.57', false)
              ],
            ),
          ],
        )
      ],
    );

  }
  Widget getFoodCard(String imgPath, String fruitName, String price, bool isFav){
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        width: ( MediaQuery.of(context).size.width / 2 ) - 30.0,
        height: 220.0,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: isFav ? Icon(Icons.favorite, color: Colors.red, size: 30.0,)
                        : Icon(Icons.favorite_border, color: Colors.red, size: 30.0,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text(
              fruitName,
              style: new TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            Text(
              '\$' + price + " each",
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
