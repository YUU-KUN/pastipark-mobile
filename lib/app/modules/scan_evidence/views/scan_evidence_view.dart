import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_evidence_controller.dart';

class ScanEvidenceView extends GetView<ScanEvidenceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScanEvidenceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScanEvidenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
