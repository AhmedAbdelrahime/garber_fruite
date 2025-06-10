class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

class ProductModel {
  final String name;
  final String image;
  final String price;
  final String rate;
  final String rateCount;
  final Function() onTap;
  bool isInBasket; // Add this field

  ProductModel(
    this.name,
    this.image,
    this.price,
    this.rate,
    this.rateCount,
    this.onTap, {
    this.isInBasket = false,
  });
}
