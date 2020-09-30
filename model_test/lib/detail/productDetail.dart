import 'package:flutter/material.dart';
import 'package:model_test/model/productModel.dart';

import '../main.dart';

class ProductPage extends StatefulWidget {
  final Product item;

  const ProductPage({Key key, this.item}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(this.widget.item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                      image: AssetImage(this.widget.item.image
                      ),
                    fit: BoxFit.cover
                  )
              ),
            ),
            Text(widget.item.name, style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0),),
            Text(widget.item.description, style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0),),
            Text('Price : ' + widget.item.price.toString(), style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),),
            RatingBox()
          ],
        ),
      )
    );
  }
}
