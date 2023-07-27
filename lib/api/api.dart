import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jada/model/usermodel.dart';

class ApiServices {
  String endPoint = 'https://reqres.in/api/users?page=1';
  Future<List<UserModel>> getUser() async {
    http.Response response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((element) => UserModel.fromJson(element)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
