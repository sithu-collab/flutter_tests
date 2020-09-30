import 'package:database_test/database/moor_database.dart';
import 'package:flutter/material.dart';

class OrdersDetailPage extends StatefulWidget {

  @override
  _OrdersDetailPageState createState() => _OrdersDetailPageState();
}

class _OrdersDetailPageState extends State<OrdersDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: (){
          Navigator.of(context).pop(context);
        },),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: AppDatabase().watchAllOrder(),
          builder: (context, AsyncSnapshot<List<Order>> snapshot){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                            backgroundColor: Colors.red,
                            radius: 20,
                          ),
                          title: Text('${snapshot.data[index].productName}'),
                          subtitle: Text('Rs.${snapshot.data[index].price}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                AppDatabase().deleteOrder(snapshot.data[index]);
                              });
                            },
                          )
                      ),
                    ),
                  );
                }
            );
          },
        ),
      )
    );
  }
}
