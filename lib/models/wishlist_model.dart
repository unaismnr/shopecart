class WishlistModel {
  int id;
  String name;
  double price;
  int qty = 1;
  String image;

  WishlistModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.image,
  });
}
