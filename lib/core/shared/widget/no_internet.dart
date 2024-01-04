import 'package:flutter/material.dart';

import '../../configuration/size_config.dart';
import '../../constant/colors/app_color.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kBackGroundColor,
        body: Center(
          child: Text(
            'Please Check Your Internet',
            style: TextStyle(
              fontSize: SizeConfig.defaultSize! * 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
