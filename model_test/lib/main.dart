import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_test/model/productModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'detail/productDetail.dart';

void main () {
  runApp(new MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Product Navigation'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, index){
          return GestureDetector(
            child: ProductBox(item: items[index],),
            onTap: () {
              Navigator.of(context).push((MaterialPageRoute(
                builder: (context) => ProductPage(item: items[index],)
              )));
            },
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {

   final Product item;

  const ProductBox({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 120.0,
                 width: 120.0,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                    image: AssetImage(this.item.image),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ScopedModel<Product>(
                  model: this.item,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.item.name, style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0),),
                      SizedBox(height: 5.0,),

                      Text(this.item.description, style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0),),
                      SizedBox(height: 5.0,),

                      Text('Price : ' + this.item.price.toString(), style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),),

                      ScopedModelDescendant<Product>(
                        builder: (context, child, item) => RatingBox(item: item,),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {

  final Product item;

  const RatingBox({Key key, this.item}) : super(key: key);
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () => this.widget.item.updateRating(1),
          icon: (widget.item.rating >= 1) ? Icon(Icons.star, color: Colors.red, size: 20.0,) :
          Icon(Icons.star_border, color: Colors.grey,),
        ),
        IconButton(
          onPressed: () => this.widget.item.updateRating(2),
          icon: (widget.item.rating >= 2) ? Icon(Icons.star, color: Colors.red, size: 20.0,) :
          Icon(Icons.star_border, color: Colors.grey,),
        ),
        IconButton(
          onPressed: () => this.widget.item.updateRating(3),
          icon: (widget.item.rating >= 3) ? Icon(Icons.star, color: Colors.red, size: 20.0,) :
          Icon(Icons.star_border, color: Colors.grey,),
        ),
      ],
    );
  }
}

