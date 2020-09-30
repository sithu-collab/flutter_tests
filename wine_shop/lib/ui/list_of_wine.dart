import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wine_shop/wine_detail.dart';

class ListOfWinePage extends StatefulWidget {
  @override
  _ListOfWinePageState createState() => _ListOfWinePageState();
}

class _ListOfWinePageState extends State<ListOfWinePage> {
  var selectedItem = 'All products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                    ),
                    Positioned(
                      top: 10.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.shopping_basket,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35.0,
                       child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: new Text('8',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              child: Text('Starbucks Coffee',
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
            child: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _builtWineCard('All products', 50),
                  _builtWineCard('Rose', 37),
                  _builtWineCard('Black', 40),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.0,),

          Container(
            height: 330.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _builtProductCard('images/wine_1.jpg', 'Johnson & Odette', 'Gold', 599.79, 5),
                _builtProductCard('images/wine_3.jpg', 'Tigreal & Badang', 'White', 799.47, 4),
                _builtProductCard('images/wine_4.jpg', 'Lesley & Gusion', 'Black', 499.37, 3),
                _builtProductCard('images/wine_5.jpg', 'Fanny & Claude', 'Red', 700.54, 4),


              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _builtProductCard(String imgPath, String productName, String productType, double price, int rating){
    return InkWell(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
          builder: (context) => WineDetailPage(heroTag: imgPath, prodName: productName, prodType: productType, amount: price, rating: rating,)
        )));
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              height: 300.0,
              width: 220.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Hero(
              tag: imgPath,
              child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 180.0,
                  width: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)),
                    image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),

            ),

          Positioned(
            top: 180.0,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(productName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),),
                  SizedBox(height: 10.0,),
                  Text(productType,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontFamily: 'Raleway',
                    ),),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Container(
                      height: 50.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('\$' + price.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                              ),),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  color: Colors.grey,
                                  iconSize: 25.0,
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _builtWineCard(String prodName, int count) {
    return  Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Container(
              height: 50.0,
              width: 120.0,
              decoration: BoxDecoration(
                  color: selectColor(prodName),
                  borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: selectBorderColor(prodName),
                  style: BorderStyle.solid,
                  width: 1.0
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                child:InkWell(
                  onTap: () {
                    selectedProduct(prodName);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(count.toString(),
                        style: new TextStyle(
                            color: selectCountColor(prodName),
                            fontFamily: 'Raleway',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      Text(prodName,
                        style: new TextStyle(
                            color: selectProductColor(prodName),
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }

  selectedProduct(prodName) {
    setState(() {
      selectedItem = prodName;
    });
  }

  selectColor(prodName) {
      if(selectedItem == prodName){
        return Colors.green;
      }else{
        return Colors.white30.withOpacity(0.5);
      }
  }

  selectBorderColor(prodName) {
      if(selectedItem == prodName){
        return Colors.white;
      }else{
        return Colors.grey.withOpacity(0.5);
      }
  }
  selectCountColor(prodName) {
      if(selectedItem == prodName){
        return Colors.white;
      }else{
        return Colors.black;
      }
  }
  selectProductColor(prodName) {
      if(selectedItem == prodName){
        return Colors.white;
      }else{
        return Colors.grey;
      }

  }

}

