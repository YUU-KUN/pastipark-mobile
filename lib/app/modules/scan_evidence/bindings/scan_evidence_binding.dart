import 'package:get/get.dart';

import '../controllers/scan_evidence_controller.dart';

class ScanEvidenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanEvidenceController>(
      () => ScanEvidenceController(),
    );
  }
}
