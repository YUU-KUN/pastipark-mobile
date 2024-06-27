import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/theme/font.dart';
import 'package:pastipark_mobile/app/widgets/full_elevated_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../controllers/report_create_controller.dart';

class ReportCreateView extends GetView<ReportCreateController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportCreateController());

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Lapor Parkir Liar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Judul Laporan', style: h4Medium.copyWith(color: greyColor)),
              TextField(
                onChanged: (controller.setTitle),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Lokasi Laporan',
                  style: h4Medium.copyWith(color: greyColor)),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Detail Laporan',
                  style: h4Medium.copyWith(color: greyColor)),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Bukti', style: h4Medium.copyWith(color: greyColor)),
              SizedBox(height: 8),
              Row(
                children: [
                  Obx(
                    () => controller.evidencePath.value.isEmpty
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 50,
                            width: 50,
                            child: Image.file(
                              fit: BoxFit.cover,
                              controller.evidences.value,
                            ),
                          ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: black,
                      elevation: 1,
                    ),
                    onPressed: () {
                      controller.pickImage('camera');
                    },
                    icon: Icon(
                      PhosphorIcons.camera(),
                      size: 32.0,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: black,
                      elevation: 1,
                    ),
                    onPressed: () {
                      controller.pickImage('gallery');
                    },
                    icon: Icon(
                      PhosphorIcons.uploadSimple(),
                      size: 32.0,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              FullElevatedButton(
                  action: () => {
                    controller.createReport(),
                  },
                  text: 'Tambahkan Laporan')
            ],
          ),
        ),
      ),
    );
  }
}
