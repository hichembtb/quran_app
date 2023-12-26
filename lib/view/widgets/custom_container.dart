import 'package:flutter/material.dart';

import '../../core/configuration/size_config.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/constant/style/text_style.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.height1,
      required this.image,
      required this.title,
      required this.color,
      this.onpressed})
      : super(key: key);

  final double height1;
  final String image;
  final String title;
  final Function()? onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenWidth! * .06),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: height1,
          width: SizeConfig.screenWidth! * .4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(1.5, 3), // changes position of shadow
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(kDashboard),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight! * .02,
                horizontal: SizeConfig.screenWidth! * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: SizeConfig.screenWidth! * .15,
                    height: SizeConfig.screenHeight! * .07,
                  ),
                  const Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.screenWidth! * .02),
                    child: Text(title, style: titleStyle("", null)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
