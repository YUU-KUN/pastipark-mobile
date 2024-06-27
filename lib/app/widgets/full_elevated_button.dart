import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pastipark_mobile/app/theme/color.dart';
import 'package:pastipark_mobile/app/theme/font.dart';

class FullElevatedButton extends StatelessWidget {
  const FullElevatedButton({
    super.key,
    required this.action,
    required this.text,
  });

  final action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width, 56),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: h4Bold.copyWith(color: whiteColor),
      ),
    );
  }
}
