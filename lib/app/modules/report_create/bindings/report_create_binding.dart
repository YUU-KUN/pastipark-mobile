import 'package:get/get.dart';

import '../controllers/report_create_controller.dart';

class ReportCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportCreateController>(
      () => ReportCreateController(),
    );
  }
}
