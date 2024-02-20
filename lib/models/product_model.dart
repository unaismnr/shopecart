class ProductModel {
  int? id;
  int? catid;
  String? productname;
  double? price;
  String? image;
  String? description;

  ProductModel({
    this.id,
    this.catid,
    this.productname,
    this.price,
    this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      catid: json["catId"],
      productname: json["productname"],
      price: double.parse(json["price"].toString()),
      image: json["image"],
      description: json["description"],
    );
  }
}
