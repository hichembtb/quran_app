import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/constant/variables.dart';
import '../../core/shared/widget/appbar.dart';
import '../../models/quran_model.dart';
import '../widgets/quran_widgets/quran_list_tile.dart';

class QuranList extends GetView<HomeController> {
  const QuranList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.builder(
          itemCount: quranMap.length,
          itemBuilder: (context, index) {
            QuranModel soura = quranMap[index + 1]!;
            return QuranListTile(
              arName: soura.arName,
              frName: soura.frName,
              onTap: () =>
                  controller.readSoura("${soura.frName}.pdf", index + 1),
            );
          },
        ),
      ),
    );
  }
}
