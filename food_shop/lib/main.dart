import 'package:flutter/material.dart';

void main () {
  runApp(new MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFood = 'BURGER';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400.0,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(Rect.fromLTRB(rect.width, 0, rect.width, rect.width));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset('assets/wine_1.jpg',width: MediaQuery.of(context).size.width, height: 400.0, fit: BoxFit.cover,),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text('Wine Shop',
                style: new TextStyle(fontSize: 70.0,letterSpacing: 2.0, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.3)), ),
              ),
              Positioned(
                top: 5.0,
                right: 12.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: IconButton(icon: Icon(Icons.notifications), color: Colors.black, iconSize: 25.0, onPressed: () {},),
                ),
              ),
              Positioned(
                top: 4.0,
                right: 10.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
              ),
              Positioned(
                top: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Welcome To', style: TextStyle(color: Colors.white, fontSize: 40.0, fontFamily: 'Raleway', fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Wine Shop', style: TextStyle(color: Colors.pink,  fontSize: 30.0, fontFamily: 'Raleway', fontWeight: FontWeight.bold),),
                          SizedBox(width: 10.0,),
                          Text(',NewYork', style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Raleway', fontWeight: FontWeight.bold),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Let\'s explore some food here',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white, size: 20.0,),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildMenuItem('BURGER', Icons.fastfood),
                    _buildMenuItem('Coffee', Icons.free_breakfast),
                    _buildMenuItem('Dinner', Icons.local_dining),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildMenuItem('Red Wine', Icons.insert_chart),
                    _buildMenuItem('Yellow Wine', Icons.cloud),
                    _buildMenuItem('Green Wine', Icons.cloud_circle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildMenuItem('Blue Wine', Icons.local_dining),
                    _buildMenuItem('Purple Wine', Icons.fastfood),
                    _buildMenuItem('Rose Wine', Icons.free_breakfast),
                  ],
                )
              ],
            ),
          )


        ],
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        selectedMenuOption(foodName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 300),
          height: selectedFood == foodName ? 110.0 : 100.0,
          width: selectedFood == foodName ? 110.0 : 100.0,
          color: selectedFood == foodName ? Colors.pink : Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Icon(iconData, color: selectedFood == foodName ? Colors.white : Colors.grey, size: 35.0,),
                SizedBox(height: 20.0,),
                Text(foodName, style: TextStyle(color: selectedFood == foodName ? Colors.white : Colors.grey, fontFamily: 'Raleway', fontSize: 17.0),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectedMenuOption(foodName) {
    setState(() {
      selectedFood = foodName;
    });
  }
}




