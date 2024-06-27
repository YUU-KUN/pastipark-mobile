import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pastipark_mobile/app/theme/font.dart';

import '../controllers/report_create_confirmation_controller.dart';

class ReportCreateConfirmationView
    extends GetView<ReportCreateConfirmationController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportCreateConfirmationController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 52),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png'),
              SizedBox(height: 16),
              Text(
                'Laporan Berhasil',
                style: h2SemiBold,
              ),
              SizedBox(height: 6),
              Text(
                'Laporan kamu akan diverifikasi terlebih dahulu oleh pihak yang berwenang. Terima kasih atas kontribusi kamu!',
                style: h4Regular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
