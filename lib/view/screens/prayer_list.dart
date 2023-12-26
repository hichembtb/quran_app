import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/prayer_controller.dart';
import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/shared/widget/appbar.dart';
import '../../core/shared/widget/no_internet.dart';
import '../widgets/prayer_widgets/prayer_presentaion.dart';

class PrayerList extends StatelessWidget {
  const PrayerList({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PrayerController prayerController = Get.put(PrayerController());
    return Scaffold(
      backgroundColor: AppColor.kBackGroundColor,
      appBar: kAppBar,
      body: FutureBuilder(
        future: prayerController.getLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const NoInternet();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GetBuilder<PrayerController>(
            init: prayerController,
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    PrayerPresentaion(
                      primColor: AppColor.kBlueColor,
                      secColor: AppColor.kBlueColor.withOpacity(0.7),
                      salatFr: "Fajr",
                      salatTime: DateFormat.jm()
                          .format(prayerController.prayerTimes!.fajr),
                      salatAr: "الفجر",
                    ),
                    PrayerPresentaion(
                      primColor: AppColor.kPurpleColor,
                      secColor: AppColor.kPurpleColor.withOpacity(0.7),
                      salatFr: "Dhur",
                      salatTime: DateFormat.jm()
                          .format(prayerController.prayerTimes!.dhuhr),
                      salatAr: "الظهر",
                    ),
                    PrayerPresentaion(
                      primColor: AppColor.kRedColor,
                      secColor: AppColor.kRedColor.withOpacity(0.7),
                      salatFr: "Asr",
                      salatTime: DateFormat.jm()
                          .format(prayerController.prayerTimes!.asr),
                      salatAr: "العصر",
                    ),
                    PrayerPresentaion(
                      primColor: AppColor.kGreenColor,
                      secColor: AppColor.kGreenColor.withOpacity(0.7),
                      salatFr: "Maghrib",
                      salatTime: DateFormat.jm()
                          .format(prayerController.prayerTimes!.maghrib),
                      salatAr: "المغرب",
                    ),
                    PrayerPresentaion(
                      primColor: AppColor.kPrimaryColor,
                      secColor: AppColor.kSecondaryColor.withOpacity(0.7),
                      salatFr: "Isha",
                      salatTime: DateFormat.jm()
                          .format(prayerController.prayerTimes!.isha),
                      salatAr: "العشاء",
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
