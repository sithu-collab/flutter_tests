import 'package:flutter/material.dart';
import 'package:shop_ui/model/wineModel.dart';
import 'package:shop_ui/style.dart';
class WineCard extends StatelessWidget {
  final WineModel wineItems;

  const WineCard({Key key, this.wineItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
      child: Container(
        height: 240.0,
        width: 170.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 170.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(2, 2),
                          blurRadius: 0.5,
                          spreadRadius: 1.0
                      )
                    ]

                ),
              ),
            ),
            Positioned(
              top: 10.0,
              right: 25.0,
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                    image: AssetImage(wineItems.image),
                    fit: BoxFit.cover
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.1,
                      blurRadius: 0.1
                    )
                  ]
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                children: <Widget>[
                  Text(wineItems.title, style: wineTitleStyle,),
                  SizedBox(height: 8.0,),
                  Text('Year : ' + wineItems.year.toString(), style: wineYearStyle,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
