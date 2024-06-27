import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pastipark_mobile/app/data/helper/api_helper.dart';

class ReportsService {
  static final String baseUrl = ApiHelper.baseUrl;

  final box = GetStorage();
  Dio dio = Dio();

  Future<Map<String, dynamic>> getReportStatistics() async {
    final token = box.read('token');

    final response = await http.get(
      Uri.parse('$baseUrl/reports/statistics'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get reports');
    }
  }

  Future<Map<String, dynamic>> createReport(
      String title,
      String detail,
      String location,
      File evidences,
      String category,
      String lisencePlate) async {
    final String apiUrl = '$baseUrl/reports'; // Replace with your base URL
    Dio dio = Dio();

    try {
      String fileName = evidences.path.split('/').last;

      String token = box.read('token');

      FormData formData = FormData.fromMap({
        "title": 'title',
        "detail": 'detail',
        "location": 'location',
        "evidences":
            await MultipartFile.fromFile(evidences.path, filename: fileName),
        "category": 'ILLEGAL_PARKING',
        "lisencePlate": 'your_license_plate', // Provide the actual value here
      });

      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Report created successfully');
        print(response.toString());
        return response.data;
      } else {
        print('Failed to create report');
        print(response.data.toString());
        throw Exception('Failed to create report');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to upload image');
    }
  }

  Future<void> uploadImage(File image) async {
    final String apiUrl =
        'https://yourapi.com/upload'; // Replace with your API URL
    Dio dio = Dio();

    try {
      String fileName = image.path.split('/').last;

      FormData formData = FormData.fromMap({
        "evidences":
            await MultipartFile.fromFile(image.path, filename: fileName),
      });

      Response response = await dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        print("Image uploaded successfully: ${response.data}");
      } else {
        print("Image upload failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
