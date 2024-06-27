import 'package:get/get.dart';

import '../controllers/report_create_confirmation_controller.dart';

class ReportCreateConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportCreateConfirmationController>(
      () => ReportCreateConfirmationController(),
    );
  }
}
