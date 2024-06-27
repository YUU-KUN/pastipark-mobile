import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/theme/font.dart';
import 'package:pastipark_mobile/app/widgets/bottom_navbar.dart';
import 'package:pastipark_mobile/app/widgets/full_elevated_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 16,
            ),
            VehicleCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: Get.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF9C9C9C).withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 22,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Parkir Mudah & Aman',
            style: h4SemiBold,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              VehicleItem(icon: PhosphorIcons.car(), title: 'Mobil'),
              VehicleItem(icon: PhosphorIcons.motorcycle(), title: 'Motor'),
              VehicleItem(icon: PhosphorIcons.bus(), title: 'Bus'),
              VehicleItem(icon: PhosphorIcons.truck(), title: 'Truk'),
              VehicleItem(icon: PhosphorIcons.scooter(), title: 'Skuter'),
            ],
          ),
          SizedBox(height: 20),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Expanded(
          //       child: Container(
          //         color: Color(0xFFF1F1F1),
          //         child: TextField(
          //           decoration: InputDecoration(
          //             prefixIcon: Icon(Icons.search),
          //             border: InputBorder.none,
          //             hintText: 'Cari ',
          //             hintStyle: h5Regular.copyWith(color: greyColor),
          //           ),
          //         ),
          //       ),
          //     ),
          //     IconButton(
          //       color: primaryColor,
          //       style: IconButton.styleFrom(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //         padding: EdgeInsets.all(12),
          //         backgroundColor: primaryColor,
          //       ),
          //       onPressed: () {},
          //       icon: Icon(
          //         PhosphorIcons.faders(),
          //         size: 14.0,
          //         color: whiteColor,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
            ),
            child: Image.asset('assets/images/avatar.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lokasi',
                style: h4Medium.copyWith(color: greyColor),
              ),
              Row(
                children: [
                  Icon(
                    PhosphorIcons.mapPin(),
                    size: 18.0,
                  ),
                  Text('Pasir Kaliki, Bandung', style: h4Medium),
                ],
              )
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
            ),
            child: Icon(
              PhosphorIcons.bell(),
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleItem extends StatelessWidget {
  const VehicleItem({
    super.key,
    required this.icon,
    required this.title,
  });
  final PhosphorIconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.05),
          ),
          child: Icon(
            icon,
            size: 20,
            color: primaryColor,
          ),
        ),
        Text(title, style: h5Regular),
      ],
    );
  }
}
