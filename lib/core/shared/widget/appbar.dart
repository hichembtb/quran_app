import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../constant/colors/app_color.dart';
import '../../constant/images/app_images.dart';
import '../../constant/style/text_style.dart';

HijriCalendar _hijri = HijriCalendar.now();
PreferredSizeWidget? kAppBar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: false,
  iconTheme: const IconThemeData(color: AppColor.kGreenColor),
  title: Text(
    _hijri.toFormat(" dd MMMM yyyy"),
    textAlign: TextAlign.left,
    style: titleGreenStyle(),
  ),
  actions: const [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: AppColor.kBlueColor,
        backgroundImage: AssetImage(
          kMoon,
        ),
      ),
    ),
  ],
);
