import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/widgets/upload_page.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: whiteColor,
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
        )
        // primaryColorLight: whiteColor,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   primary: whiteColor,
        // )
      ),
      title: "PastiPark",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
