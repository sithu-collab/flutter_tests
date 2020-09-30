import 'package:flutter/material.dart';
import 'topPage.dart';
import 'OutdoorPage.dart';
import 'NaturePage.dart';
import 'IndoorPage.dart';
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {},
        ),

        actions: <Widget>[
             IconButton(
              icon: Icon(Icons.shopping_cart),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {},
            ),

        ],
      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: new Text('Top Picks',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'
            ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              tabs: <Widget>[
               Tab(
                 child: new Text(
                   'Top',
                   style: new TextStyle(
                     fontFamily: 'Montserrat',
                     fontWeight: FontWeight.bold,
                     fontSize: 20.0
                   ),
                 ),
               ),
                Tab(
                  child: new Text(
                    'Outdoor',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),
                Tab(
                  child: new Text(
                    'Indoor',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),
                Tab(
                  child: new Text(
                    'Nature',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new TopPlantPage(),
                new OutdoorPage(),
                new IndoorPage(),
                new NaturePage(),

              ],
            ),

          )


        ],
      ),
    );
  }
}
