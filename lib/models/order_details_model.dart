class OrderDetailsModel {
  int id;
  String username;
  double totalamount;
  String paymentmethod;
  String date;
  List<ProductList> products;

  OrderDetailsModel({
    required this.id,
    required this.username,
    required this.totalamount,
    required this.paymentmethod,
    required this.date,
    required this.products,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json["id"],
      username: json["username"],
      totalamount: json["totalamount"].toDouble(),
      paymentmethod: json["paymentmethod"],
      date: json["date"],
      products: List<ProductList>.from(
        json["products"].map(
          (e) => ProductList.fromJson(e),
        ),
      ),
    );
  }
}

class ProductList {
  String? productname;
  double? price;
  String? image;
  int? quantity;

  ProductList({
    this.productname,
    this.price,
    this.image,
    this.quantity,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    return ProductList(
      productname: json["productname"],
      price: json["price"].toDouble(),
      image: json["image"],
      quantity: json["quantity"] != null ? json["quantity"] as int : 0,
    );
  }
}
