import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pastipark_mobile/app/services/api_service.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final box = GetStorage();
  final String baseUrl = ApiService.baseUrl;

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // or ImageSource.camera

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  void handleImageUpload() async {
    File? image = await pickImage();
    if (image != null) {
      try {
        var response = await uploadImage(image);
        print('Upload success: $response');
      } catch (e) {
        print('Upload failed: $e');
      }
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Center(
        child: ElevatedButton(
          onPressed: handleImageUpload,
          child: Text('Upload Image'),
        ),
      ),
    );
  }

  Future<dynamic> uploadImage(File image) async {
    final token = box.read('token');
    final String apiUrl = '$baseUrl/reports'; // Replace with your base URL
    Dio dio = Dio();

    try {
      String fileName = image.path.split('/').last;

      FormData formData = FormData.fromMap({
        "title": 'title',
        "detail": 'detail',
        "location": 'location',
        "evidences":
            await MultipartFile.fromFile(image.path, filename: fileName),
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
        return json.decode(response.data);
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
}
