import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pastipark_mobile/app/data/helper/api_helper.dart';

class AuthService {
  static final String baseUrl = ApiHelper.baseUrl;
  final box = GetStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final body = json.encode({"email": email, "password": password});

    final response = await http.post(Uri.parse('$baseUrl/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create new conversation');
    }
  }

  Future<Map<String, dynamic>> register(String name, String email,
      String password, String passwordConfirmation) async {
    final body = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "passwordConfirmation": passwordConfirmation
    });

    final response = await http.post(Uri.parse('$baseUrl/auth/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create new conversation');
    }
  }

  Future<bool> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
