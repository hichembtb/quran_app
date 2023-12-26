import 'package:flutter/material.dart';

import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/shared/widget/appbar.dart';
import '../widgets/dashboard.dart';
import '../widgets/aya_of_day.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColor.kBackGroundColor,
      appBar: kAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.screenHeight! * .01),
                  child: Center(
                    child: Image(
                      image: const AssetImage(kLogo),
                      width: SizeConfig.screenWidth! * .2,
                    ),
                  )),
              AyaOfTheDayWidget(),
              Dashboard()
            ],
          ),
        ),
      ),
    );
  }
}
