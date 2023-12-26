import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../../core/shared/widget/appbar.dart';
import 'loading_indicator.dart';
import 'qiblah_compass.dart';

class Qibla extends StatefulWidget {
  const Qibla({super.key});

  @override
  QiblaState createState() => QiblaState();
}

class QiblaState extends State<Qibla> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: kAppBar,
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }

            if (snapshot.data!) {
              return const QiblahCompass();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
