import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/theme/font.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List pages = [Routes.HOME, Routes.HOME, Routes.REPORT, Routes.REPORT];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF9C9C9C).withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 22,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: black,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: h5SemiBold,

        elevation: 0,
        currentIndex: 0,
        // currentIndex: controller.currentIndex.value,
        onTap: (index) {
          Get.toNamed(pages[index]);
          // controller.currentIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.house(),
              size: 32.0,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.ticket(),
              size: 32.0,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.megaphone(),
              size: 32.0,
            ),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.user(),
              size: 32.0,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
