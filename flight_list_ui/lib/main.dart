import 'package:flight_list_ui/bottom_navigation_bar.dart';
import 'package:flight_list_ui/flight_list_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';
import 'strings.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(new MaterialApp(
    title: 'Flight List Mock Up',
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
    theme: appTheme,
  ));
}

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Montserrat');

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              MainScreenTopPart(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(Strings.currently_watch,
                    style: new TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 16.0
                    ),),
                    Text(
                      Strings.view_all,
                        style: new TextStyle(color: appTheme.primaryColor,
                        fontFamily: 'Montserrat',
                        fontSize: 15.0
                        ),
                    )
                  ],
                ),
              ),
              Container(
                height: 293.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MainScreenBottomPart('images/dubai.jpg', 'Dubai', 'Apr 2019', 50, 599, 499 ),
                    MainScreenBottomPart('images/new_york.jpg', 'New York', 'May 2019', 40, 599, 499 ),
                    MainScreenBottomPart('images/boston.jpg', 'Boston', 'June 2019', 30, 599, 499 ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final formatCurrency = new NumberFormat.simpleCurrency();
Widget MainScreenBottomPart(String imgPath, String cityName, String monthYear, int  discount, int oldPrice, int newPrice) {
  return Column(
    children: <Widget>[
       InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 230.0,
                width: 160.0,
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 220.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(cityName, style: new TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),),
                        Text(monthYear, style: new TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Montserrat'),)
                      ],
                    ),
                    Container(
                      width: 40.0,
                      height: 17.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        shape: BoxShape.rectangle,
                      ),

                      child: Center(
                        child: Text(
                          "$discount%",
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Row(
          children: <Widget>[
            Text('${formatCurrency.format(newPrice)}', style: new TextStyle(color: Colors.black, fontFamily: 'Montserrat'),),
            SizedBox(width: 5.0,),
            Text('(${formatCurrency.format(oldPrice)})', style: new TextStyle(color: Colors.grey, fontFamily: 'Montserrat'),)
          ],
        ),
      )

    ],
  );
}

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

List<String> locations = ["Boston (BOS)", "New York City (JFK)"];

const TextStyle dropDownItemTextStyle = TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Montserrat');
const TextStyle dropDownMenuTextStyle = TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'Montserrat');
const TextStyle headerTextStyle = TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: 'Montserrat', fontWeight: FontWeight.w900,);


class MainScreenTopPart extends StatefulWidget {
  @override
  _MainScreenTopPartState createState() => _MainScreenTopPartState();
}

class _MainScreenTopPartState extends State<MainScreenTopPart> {
  int selectedLocationsIndex = 0;

  bool isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 370.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor,
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationsIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationsIndex],
                              style: dropDownItemTextStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(
                              locations[0],
                              style: dropDownMenuTextStyle,
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(
                              locations[1],
                              style: dropDownMenuTextStyle,
                            ),
                            value: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: Text(
                  Strings.header,
                  style: headerTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: TextField(
                      controller: TextEditingController(),
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
                        border: InputBorder.none,
                        hintText: locations[1],
//                        hintStyle: new TextStyle(
//                          color: Colors.black.withOpacity(0.5),
//                          fontSize: 17.0,
//                          fontFamily: 'Montserrat'
//                        ),
                        suffixIcon: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          elevation: 2.0,
                          child: IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.black,
                            iconSize: 22.0,
                            onPressed: () {
                              Navigator.of(context).push((MaterialPageRoute(
                                builder: (context) => FlightListDetail()
                              )));
                            },
                          ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(onTap: () {
                    setState(() {
                      isFlightSelected = true;
                    });
                  },
                      child: ChoiceChip(Icons.flight_takeoff, 'Flights', isFlightSelected)),
                  SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },
                      child: ChoiceChip(Icons.hotel, 'Hotels', !isFlightSelected))
                ],
              )
            ],
          ),
        ),


      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isFlightSelected;

  ChoiceChip(this.icon, this.text, this.isFlightSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: widget.isFlightSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
      ) : null,
      child: Row(
        children: <Widget>[
          Icon(widget.icon,
          color: Colors.white,
          ),
          SizedBox(width: 10.0,),
          Text(widget.text,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 17.0
          ),)
        ],
      ),
    );
  }
}



