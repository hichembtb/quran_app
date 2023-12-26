import 'package:flutter/material.dart';

import '../../../core/configuration/size_config.dart';
import '../../../core/constant/colors/app_color.dart';
import '../../../core/constant/images/app_images.dart';
import '../../../core/constant/style/text_style.dart';

class QuranListTile extends StatelessWidget {
  const QuranListTile(
      {super.key,
      required this.arName,
      required this.frName,
      required this.onTap});
  final String arName;
  final String frName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: SizeConfig.screenHeight! * .065,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
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
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      frName,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: titleStyle("", 18),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      arName,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: titleStyle("arName", null),
                    ),
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
