import 'package:database_test/database/moor_database.dart';
import 'package:flutter/material.dart';
import 'order_detail.dart';

class MyHomePage extends StatelessWidget {
  static const String _title = "Database Test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("$_title"),
        backgroundColor: Colors.blueAccent
      ),
      body: SingleChildScrollView(
        child: NewOrder(),
      ),
    );
  }
}

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _productNameController,
            decoration: InputDecoration(
              hintText: 'Product Name',
            ),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: _productPriceController,
            decoration: InputDecoration(
              hintText: 'Product Price',
            ),
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text('Submit Order', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).push((MaterialPageRoute(
                    builder: (context) => OrdersDetailPage()
                )));
                setState(() {
                    AppDatabase().insertNewOrder(Order(
                      id: null,
                      price: _productPriceController.text,
                      productName: _productNameController.text,
                    ));
                });
                _productNameController.clear();
                _productPriceController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}


