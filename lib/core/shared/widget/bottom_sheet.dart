import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors/app_color.dart';

Future inBookmarkBottomSheet() {
  return Get.bottomSheet(
    backgroundColor: AppColor.kPurpleColor,
    barrierColor: Colors.transparent,
    const SizedBox(
      width: double.infinity,
      child: Text(
        'Sourah Already in Book Mark ',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Future removedFrBookmarkBottomSheet() {
  return Get.bottomSheet(
    backgroundColor: AppColor.kRedColor,
    barrierColor: Colors.transparent,
    const SizedBox(
      width: double.infinity,
      child: Text(
        'Sourah Removed From BookMark ',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
