import 'package:flight_list_ui/custom_shape_clipper.dart';
import 'package:flight_list_ui/main.dart';
import 'package:flight_list_ui/strings.dart';
import 'package:flutter/material.dart';

class FlightListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: <Widget>[
          FlightListDetailTopPart()
        ],
      )
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
            height: 160.0,
            color: appTheme.primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
        )
      ],
    );
  }
}

