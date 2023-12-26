import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors/app_color.dart';

inBookmarkBottomSheet() {
  return Get.bottomSheet(
    backgroundColor: AppColor.kPurpleColor,
    barrierColor: Colors.transparent,
    const Text(
      'Sourah Already in Book Mark ',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

removedFrBookmarkBottomSheet() {
  return Get.bottomSheet(
    backgroundColor: AppColor.kRedColor,
    barrierColor: Colors.transparent,
    const Text(
      'Sourah Removed From BookMark ',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
