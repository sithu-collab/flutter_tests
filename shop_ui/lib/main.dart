import 'package:flutter/material.dart';
import 'package:shop_ui/widgets/WineCard.dart';
import 'package:shop_ui/widgets/WineDetailCard.dart';
import 'style.dart';
import 'model/wineModel.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  final wineItems = WineModel.getWineProducts();

  int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    _currentIndex = 0;
    super.initState();
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f6fb),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 30.0, right: 16.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 22.0,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    iconSize: 22.0,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
                child: Text('Shop', style: headingStyle,)
            ),
            SizedBox(height: 20.0,),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.0),
               child: Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      offset: Offset(0, 10),
                      blurRadius: 12.0
                    )
                  ]
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: searchBarStyle,
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
             ),
            SizedBox(height: 30.0,),
            Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Special Wines', style: headingStyle,)
            ),
            SizedBox(height: 10.0,),
            Container(
              height: 240.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: wineItems.length,
                  itemBuilder: (BuildContext context, index){
                    return WineCard(wineItems: wineItems[index],);
                  }),
            ),
            SizedBox(height: 30.0,),
            Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Wine Details', style: headingStyle,)
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 180.0,
               child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: wineItems.length,
                  itemBuilder: (BuildContext context, index){
                    return WineDetailCard(wineItems: wineItems[index],);
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12.0),
        child: BubbleBottomBar(
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: changePage,
          opacity: 1.0,
          elevation: 0.0,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.home, color: Colors.black,),
              activeIcon: Icon(Icons.home, color: Colors.white,),
              title: Text('Home', style: bottomBarStyle,)
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.import_export, color: Colors.black,),
                activeIcon: Icon(Icons.import_export, color: Colors.white,),
                title: Text('Detail', style: bottomBarStyle,)
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.favorite_border, color: Colors.black,),
                activeIcon: Icon(Icons.favorite_border, color: Colors.white,),
                title: Text('Favorite', style: bottomBarStyle,)
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.person, color: Colors.black,),
                activeIcon: Icon(Icons.person, color: Colors.white,),
                title: Text('Profile', style: bottomBarStyle,)
            ),

          ],
        ),
      ),
    );
  }
}
