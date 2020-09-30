class WineModel {
  final String image;
  final String title;
  final int year;
  final String description;

  WineModel(this.image, this.title, this.year, this.description);

  static List<WineModel> getWineProducts() {
    List<WineModel> wineItems = <WineModel>[];

    wineItems.add(WineModel('images/wine_1.jpg', 'Rose Wine', 10, 'Rose wine is good for skin and very attractive to act like a smart'));
    wineItems.add(WineModel('images/wine_3.jpg', 'Black Wine', 20, 'Black wine is good for skin and very attractive  to act like a smart'));
    wineItems.add(WineModel('images/wine_4.jpg', 'Red Wine', 30, 'Red wine is good for skin and very attractive to act like a smart'));

    return wineItems;
  }
}

