import 'package:get/get.dart';
import 'package:pastipark_mobile/app/services/reports_service.dart';

class ReportController extends GetxController {
  final reports = [].obs;
  final reportStatistics = {}.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getReportStatistics();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getReportStatistics() async {
    try {
      isLoading(true);
      reportStatistics.value = await ReportsService().getReportStatistics();
    } catch (e) {
      // Get.snackbar('Error', e.toString());
      print(e);
      Get.snackbar('Error', 'Failed getting report statistics');
    } finally {
      isLoading(false);
    }
  }
}
