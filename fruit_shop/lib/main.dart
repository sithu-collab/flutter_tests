import 'package:flutter/material.dart';
import 'fruits.dart';
import 'drink.dart';
import 'bread.dart';

void main() {
  runApp(new MaterialApp(
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

    tabController = TabController(vsync: this, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: AssetImage('images/apple.jpg'),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.menu,
                  color: Colors.black,
                  ),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: new Text(
                    'Fruits',
                    style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 33.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Tab(
                  child: new Text(
                    'Breads',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Tab(
                  child: new Text(
                    'Drink',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height - 230.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new FruitsPage(),
                new FruitsPage(),
                new FruitsPage()

              ],
            ),
          )

        ],
      ),
      bottomNavigationBar: new Material(
        child: Container(
          padding: EdgeInsets.only(bottom: 8.0),
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: new Text(
                  'Filters',
                  style: new TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18.0
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.black,
                size: 30.0,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 30.0,
              ),

              Container(
                height: 40.0,
                width: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.red,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                         new Text(
                          '12',
                          style: new TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 17.0,
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
