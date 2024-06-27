import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  // final authController = Get.put(AuthController());
  final GetStorage box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    final bool isAuthenticated = box.read('token') != null;

    if (!isAuthenticated) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
