import 'package:get/get.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';

class ReportCreateConfirmationController extends GetxController {
  //TODO: Implement ReportCreateConfirmationController

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(Routes.HOME);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
