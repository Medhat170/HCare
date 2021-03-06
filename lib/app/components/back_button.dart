import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: const Card(
            elevation: 8.0,
            color: ColorUtil.lightGrey,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: ColorUtil.lightGrey,
              radius: 22.0,
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 22.0,
                  color: ColorUtil.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
