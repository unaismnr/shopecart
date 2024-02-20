import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/models/get_user_model.dart';

Future<GetUserModel> getUserApi(String username) async {
  final response = await http.post(
    Uri.parse('${apiMainUrl}get_user.php'),
    body: {'username': username},
  );
  if (response.statusCode == 200) {
    return GetUserModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Failed to load user');
  }
}
