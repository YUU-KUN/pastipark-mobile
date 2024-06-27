import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pastipark_mobile/app/data/helper/api_helper.dart';

class ApiService extends GetxService {
  static final String baseUrl = ApiHelper.baseUrl;

  final GetStorage box = GetStorage();

  Future<Map<String, dynamic>> postResults() async {
    try {
      debugPrint('$baseUrl/get-result');

      final body = json.encode({
        "ingredients": ["Susu, Ikan"],
        "preferences": ["Susu, Ikan"]
      });
      final response = await http.post(
        Uri.parse('$baseUrl/get-result'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
        debugPrint('Response body: ${response.body}');
        throw Exception('Failed to load results');
      }
    } catch (error) {
      debugPrint(error.toString());
      throw Exception('Failed to load results');
    }
  }
}
