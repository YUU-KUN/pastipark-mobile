import 'package:flutter/material.dart';

import 'color.dart';
import 'font.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(primary: primaryColor, secondary: secondaryColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: false,
  ),
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: placeholder.copyWith(
      color: placeHolder,
    ),
    border: InputBorder.none,
    outlineBorder: const BorderSide(
      color: greyColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    focusColor: font,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: font,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: redColor,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // disabledBackgroundColor: inactiveColorButton,
      disabledForegroundColor: whiteColor,
      backgroundColor: primaryColor,
      foregroundColor: whiteColor,
      textStyle: h4Bold,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
