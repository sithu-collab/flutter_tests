import 'package:scoped_model/scoped_model.dart';
class Product extends Model{
  final String name, description, image;
  final int price;
  int rating;

  Product(this.name, this.description, this.image, this.price, this.rating);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['image'],
      json['price'],
      json['rating'],

    );
  }

  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }

  static List<Product> getProducts() {
    List<Product> items = <Product> [];
    items.add(Product('Pixel', "Pixel is the most feature-full phone ever", 'images/wine_1.jpg', 900, 0));
    items.add(Product('Laptop', "Laptop is the most feature-full phone ever", 'images/wine_1.jpg', 900, 0));
    items.add(Product('Tablet', "Tablet is the most feature-full phone ever", 'images/wine_1.jpg', 900, 0));
    items.add(Product('iPhone', "iPhone is the most feature-full phone ever", 'images/wine_1.jpg', 900, 0));
    return items;
  }

}
