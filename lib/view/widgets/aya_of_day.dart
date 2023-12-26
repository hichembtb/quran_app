import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/home_controller.dart';
import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/constant/style/text_style.dart';
import '../../models/day_aya_model.dart';

class AyaOfTheDayWidget extends StatelessWidget {
  AyaOfTheDayWidget({
    Key? key,
  }) : super(key: key);
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * .15,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(1.5, 3), // changes position of shadow
            ),
          ],
          image: const DecorationImage(
              image: AssetImage(kDashboard), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColor.kPrimaryColor.withOpacity(0.7),
              AppColor.kSecondaryColor.withOpacity(0.7)
            ]),
            borderRadius: BorderRadius.circular(25)),
        child: FutureBuilder<DayAyaModel>(
          future: homeController.apiServices.getAyaOfDay(),
          builder: (context, AsyncSnapshot<DayAyaModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Icon(Icons.sync_problem_outlined);
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * .03,
                      vertical: SizeConfig.screenHeight! * .02),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (contex, index) {
                      return Shimmer.fromColors(
                        baseColor: AppColor.kSecondaryColor,
                        highlightColor: AppColor.kPrimaryColor,
                        direction: ShimmerDirection.rtl,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.all(5),
                          height: 20,
                        ),
                      );
                    },
                  ),
                );
              case ConnectionState.done:
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * .03,
                      vertical: SizeConfig.screenHeight! * .02),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              snapshot.data!.surEnName!,
                              textAlign: TextAlign.center,
                              style: subtitleStyle(),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * .02,
                          ),
                          FittedBox(
                            child: Text(
                              "${snapshot.data!.surNumber!}",
                              textAlign: TextAlign.center,
                              style: subtitleStyle(),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * .4,
                        child: ListTile(
                          title: Text(
                            snapshot.data!.arText!,
                            textAlign: TextAlign.center,
                            style: titleStyle("arName", null),
                            maxLines: 2,
                          ),
                          subtitle: Text(
                            snapshot.data!.frTran!,
                            textAlign: TextAlign.center,
                            style: subtitleStyle(),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              default:
            }
            throw Exception();
          },
        ),
      ),
    );
  }
}
