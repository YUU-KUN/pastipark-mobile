import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/services/reports_service.dart';

class ReportCreateController extends GetxController {
  final isLoading = false.obs;
  final title = ''.obs;
  final location = ''.obs;
  final detail = ''.obs;
  final category = Get.arguments['label'];
  final imageUrl = Get.arguments['imageUrl'];
  final lisencePlate = ''.obs;
  final evidences = File('').obs;

  final evidencePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setTitle(String value) => title.value = value;

  void setLocation(String value) => location.value = value;

  void setDetail(String value) => detail.value = value;

  void setLisencePlate(String value) => lisencePlate.value = value;

  void createReport() async {
    try {
      isLoading(true);
      var createdReport = await ReportsService().createReport(
          title.value,
          detail.value,
          location.value,
          evidences.value,
          category,
          lisencePlate.value);
      Get.toNamed(Routes.REPORT_CREATE_CONFIRMATION);
    } catch (e) {
      print("Error: $e");
      Get.snackbar('Error', 'Failed creating report');
    } finally {
      isLoading(false);
    }
  }

  void pickImage(String mode) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: mode == 'gallery'
            ? ImageSource.gallery
            : ImageSource.camera); // or ImageSource.camera

    if (pickedFile != null) {
      evidences.value = File(pickedFile.path);
      evidencePath.value = evidences.value.path;
    } else {
      print('No image selected.');
    }
  }

  // void handleImageUpload() async {
  //   File? image = await pickImage();
  //   if (image != null) {
  //     evidences.value = image;
  //     print(image.path);
  //     evidencePath.value = image.path;
  //     // await uploadImage(image);
  //   } else {
  //     print("No image selected.");
  //   }
  // }
}
