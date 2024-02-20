class CategoryModel {
  String? category;
  int? id;

  CategoryModel({
    this.category,
    this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        category: json["category"],
      );
}
