import 'package:flutter/material.dart';

import '../colors/app_color.dart';

titleStyle(String langName, double? fontSize) {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: fontSize ?? 18,
    fontFamily: langName == "arName" ? "Amiri" : null,
  );
}

titleGreenStyle() {
  return const TextStyle(
      color: AppColor.kGreenColor, fontWeight: FontWeight.bold, fontSize: 18);
}

subtitleStyle() {
  return const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14);
}

miniStyle() {
  return const TextStyle(color: Colors.white, fontSize: 12);
}
