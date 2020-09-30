import 'package:flutter/material.dart';

class Wine{
  String price;
  String title;
  String subTitle;
  String imgPath;
  Color bgColor;
  int rating;

  Wine(this.price, this.title, this.subTitle, this.imgPath, this.bgColor,
      this.rating);
}

var wines = [
  Wine('\$ 1299', 'Rose Wine', '70cl bottle in gift box', 'images/wine_1.jpg', Colors.blue, 4),
  Wine('\$ 899', 'Red Wine', '120cl bottle in gift box', 'images/wine_3.jpg', Colors.amberAccent, 5),

];

var recommendWines = [
  Wine('\$ 599', 'Strawberry Wine', '200cl bottle in gift box', 'images/wine_4.jpg', Colors.red, 4),
  Wine('\$ 799', 'Black Wine', '90cl bottle in gift box', 'images/wine_5.jpg', Colors.green, 5),

];