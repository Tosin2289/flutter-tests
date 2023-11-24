import 'dart:convert';
import 'package:ftests/widget_test/api_test/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepositorys {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('some error Occured');
    }
  }
}
