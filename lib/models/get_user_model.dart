class GetUserModel {
  String name;
  String phone;
  String address;

  GetUserModel({
    required this.name,
    required this.phone,
    required this.address,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return GetUserModel(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      address: json["address"].toString(),
    );
  }
}
