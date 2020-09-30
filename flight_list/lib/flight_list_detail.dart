import 'strings.dart';
import 'custom_shape_clipper.dart';
import 'strings.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class FlightListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.search_results),
        backgroundColor: appTheme.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
         Column(
            children: <Widget>[
              FlightListDetailTopPart(),
              Padding(padding: EdgeInsets.only(left: 20.0),child: Align(
                  alignment: Alignment.topLeft,child: Text(Strings.best_deal, style: new TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Montserrat',),))),
              FlightListDetailBottomPart(),
              FlightListDetailBottomPart(),
              FlightListDetailBottomPart(),
              FlightListDetailBottomPart(),
              FlightListDetailBottomPart(),
              FlightListDetailBottomPart(),
            ],
          ),

        ],
      ),
    );
  }
}

final newPriceTextStyle = TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 18.0, fontWeight: FontWeight.bold);
final oldPriceTextStyle = TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 14.0, decoration: TextDecoration.lineThrough);
final percentageTextStyle = TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 14.0);
final chipBackgroundColor = Colors.blue.withOpacity(0.3);
final chipLabelStyle = TextStyle(color: Colors.black, fontSize: 12.0, fontFamily: 'Montserrat');


class FlightListDetailBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
                style: BorderStyle.solid
              ),
            ),
          ),
        ),
        Positioned(
          top: 22.0,
          right: 10.0,
          child: Container(
            height: 20.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: appTheme.primaryColor,
            ),
            child: Center(child: Text('50%', style: percentageTextStyle,)),
          ),
        ),
        Positioned(
          top: 20.0,
          left: 22.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text('${formatCurrency.format(4159)}', style: newPriceTextStyle,),
                    SizedBox(width: 8.0,),
                    Text('(${formatCurrency.format(5159)})', style: oldPriceTextStyle,),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  FlightDetailChip(Icons.calendar_today, 'June 2020'),
                  FlightDetailChip(Icons.flight_takeoff, 'Jet Airways'),
                  FlightDetailChip(Icons.star, '4.6'),

                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


class FlightDetailChip extends StatelessWidget {

  final IconData icon;
  final String label;

  const FlightDetailChip(this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: RawChip(
        label: Text(label),
        labelStyle: chipLabelStyle,
        backgroundColor: chipBackgroundColor,
        avatar: Icon(icon, size: 14.0, color: Colors.black,),
      ),
    );
  }
}


class FlightListDetailTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 170.0,
            color: appTheme.primaryColor,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
           Card(
             margin: EdgeInsets.symmetric(horizontal: 16.0),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
             elevation: 10.0,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
               child: Row(
                 children: <Widget>[
                   Expanded(
                     flex: 4,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(Strings.boston, style: new TextStyle(color: Colors.black, fontFamily: 'Montserrat'),),
                         Divider(),
                         Text(Strings.new_york, style: new TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),),

                       ],
                     ),
                   ),
                   Spacer(),
                   Expanded(flex: 1 ,child: Icon(Icons.import_export, color: Colors.black, size: 32.0,))
                 ],
               ),
             ),
           ),
          ],
        )
      ],
    );
  }
}

