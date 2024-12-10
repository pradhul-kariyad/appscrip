// ignore_for_file: file_names, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:appscrip/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<List<UserModel>> getAll() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      log('body : ${response.body}');
      try {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => UserModel.fromJson(json)).toList();
      } catch (e) {
        log('Error parsing user list: $e');
        return [];
      }
    }
    return [];
  }
}
