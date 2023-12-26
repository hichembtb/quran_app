import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/constant/routes/app_routes.dart';
import 'custom_container.dart';

class Dashboard extends StatelessWidget {
  Dashboard({
    Key? key,
  }) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                height1: SizeConfig.screenHeight! * .27,
                image: kQuran,
                title: "Quran",
                color: AppColor.kGreenColor,
                onpressed: () => homeController.navTo(AppRoute.quranlist),
              ),
              CustomContainer(
                  height1: SizeConfig.screenHeight! * .20,
                  image: kBookmark,
                  title: "Bookmark",
                  color: AppColor.kPurpleColor,
                  onpressed: () =>
                      homeController.navTo(AppRoute.quranbookmark)),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                height1: SizeConfig.screenHeight! * .2,
                image: kPrayer,
                title: "Prayers",
                color: AppColor.kRedColor,
                onpressed: () => homeController.navTo(AppRoute.prayerList),
              ),
              CustomContainer(
                height1: SizeConfig.screenHeight! * .27,
                image: kLocation,
                title: "Qibla",
                color: AppColor.kBlueColor,
                onpressed: () => homeController.navTo(AppRoute.qibla),
              ),
            ],
          ),
        )
      ],
    );
  }
}
