import 'package:flutter/material.dart';

import '../../../core/configuration/size_config.dart';

class PrayerPresentaion extends StatelessWidget {
  const PrayerPresentaion({
    super.key,
    required this.primColor,
    required this.secColor,
    required this.salatFr,
    required this.salatTime,
    required this.salatAr,
  });

  final Color primColor;
  final Color secColor;
  final String salatFr;
  final String salatTime;
  final String salatAr;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight! * 0.1,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  primColor,
                  secColor,
                ]),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  salatFr,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  salatTime,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  salatAr,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
