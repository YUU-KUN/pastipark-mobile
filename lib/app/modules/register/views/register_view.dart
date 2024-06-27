import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pastipark_mobile/app/data/controller/auth_controller.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/theme/font.dart';
import 'package:pastipark_mobile/app/widgets/full_elevated_button.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/header.png'),
                Text(
                  'Daftar',
                  style: h4Bold.copyWith(color: whiteColor),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang👋🏻',
                    style: h3Bold,
                  ),
                  Text(
                    'Solusi parkir ramah lingkungan untuk Anda!',
                    style: h5Regular,
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      // label: Text('Email'),
                      labelText: 'Email',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      labelText: 'Kata Sandi',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      labelText: 'Konfirmasi Kata Sandi',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  FullElevatedButton(
                    action: () => controller.register(),
                    text: 'Daftar',
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      'atau lanjutkan dengan',
                      style: h5Regular,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/icons/google.png'),
                        label: Text('Google'),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/icons/facebook.png'),
                        label: Text('Facebook'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah memiliki akun? ',
                        style: h4Regular,
                      ),
                      InkWell(
                        onTap: () => Get.offAllNamed(Routes.LOGIN),
                        child: Text(
                          'Masuk',
                          style: h4Bold.copyWith(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
