import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/theme/font.dart';
import 'package:pastipark_mobile/app/widgets/bottom_navbar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Laporan Kamu', style: h3SemiBold),
            Text('Update 23 Mei 2024', style: h5Regular),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
              shrinkWrap: true,
              children: [
                Obx(
                  () => controller.isLoading.value
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : ReportCard(
                          count: controller.reportStatistics['data']['count'] ?? 0,
                          label: 'Laporan',
                          imageUrl: 'assets/icons/report/reported.png',
                        ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : ReportCard(
                          count: controller.reportStatistics['data']
                              ['rejected'] ?? 0,
                          label: 'Ditolak',
                          imageUrl: 'assets/icons/report/processed.png',
                        ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : ReportCard(
                          count: controller.reportStatistics['data']
                              ['resolved'] ?? 0,
                          label: 'Terselesaikan',
                          imageUrl: 'assets/icons/report/resolved.png',
                        ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : ReportCard(
                          count: controller.reportStatistics['data']
                              ['processed'] ?? 0,
                          label: 'Ditindaklanjuti',
                          imageUrl: 'assets/icons/report/handled.png',
                        ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Laporkan issue parkir',
              style: h3SemiBold,
            ),
            Text(
              'Pilih kategori di bawah untuk membantu kami menyelesaikan masalah dan mengatasi parkir liar',
              style: h5Regular,
            ),
            SizedBox(height: 16),
            const Wrap(
              runSpacing: 16,
              children: [
                IssueItem(title: 'Parkir Liar', label: 'ILLEGAL_PARKING'),
                IssueItem(title: 'Parkir Ganda', label: 'DOUBLE_PARKING'),
                IssueItem(
                    title: 'Kendaraan Menghalangi',
                    label: 'OBSTRUCTING_VEHICLE'),
                IssueItem(
                    title: 'Kerusakan Fasilitas', label: 'FACILITY_DAMAGE'),
                IssueItem(title: 'Lainnya', label: 'OTHER'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class IssueItem extends StatelessWidget {
  const IssueItem({
    super.key,
    required this.title,
    required this.label,
  });
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offNamed(Routes.REPORT_CREATE, arguments: {'label': label});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: h4SemiBold.copyWith(color: darkGray)),
          Icon(
            PhosphorIcons.caretRight(),
            size: 32.0,
            color: darkGray,
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final int count;
  final String label;
  final String imageUrl;

  ReportCard(
      {required this.count, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: whiteColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Image.asset(
              imageUrl,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
