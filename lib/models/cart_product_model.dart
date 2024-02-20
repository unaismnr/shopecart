import 'dart:developer';

class CartProductModel {
  int id;
  String name;
  double price;
  int qty = 1;
  String image;

  CartProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.image,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      qty: json['qty'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    log('Cart Quantity: $qty');
    log('Cart name: $name');
    log('Cart id: $id');
    return {'id': id, 'name': name, 'price': price, 'qty': qty, 'image': image};
  }

  void increase() => qty++;

  void decrease() => qty--;
}
