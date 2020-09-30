import 'package:flutter/material.dart';
import 'package:shop_ui/model/wineModel.dart';
import 'package:shop_ui/style.dart';
class WineDetailCard extends StatefulWidget {

  final WineModel wineItems;

  const WineDetailCard({Key key, this.wineItems}) : super(key: key);
  @override
  _WineDetailCardState createState() => _WineDetailCardState();
}

class _WineDetailCardState extends State<WineDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            height: 140.0,
            width: 250.0 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(2, 2),
                      blurRadius: 0.5,
                      spreadRadius: 1.0
                  )
                ]
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget.wineItems.title, style: wineTitleStyle,),
                  SizedBox(height: 8.0,),
                  Text(widget.wineItems.description, style: wineDescStyle,)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 5.0,
          right: 30.0,
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(widget.wineItems.image),
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
        )

      ],
    );
  }
}
