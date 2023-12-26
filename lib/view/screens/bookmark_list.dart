import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../controllers/home_controller.dart';
import '../../core/configuration/size_config.dart';
import '../../core/constant/constant/variables.dart';
import '../../core/shared/widget/appbar.dart';
import '../../core/shared/widget/bottom_sheet.dart';
import '../../models/bookmark_model.dart';
import '../../models/quran_model.dart';
import '../widgets/quran_widgets/quran_list_tile.dart';

class BookMarkList extends GetView<HomeController> {
  const BookMarkList({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: kAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<BookMark>(kBookMarkBox).listenable(),
          builder: (context, Box<BookMark> box, child) {
            if (box.isNotEmpty) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  QuranModel soura = quranMap[box.getAt(index)!.surahIndex!]!;

                  return GestureDetector(
                    onLongPress: () {
                      box.deleteAt(index).then((value) {
                        removedFrBookmarkBottomSheet();
                      });
                    },
                    child: QuranListTile(
                      arName: soura.arName,
                      frName: soura.frName,
                      onTap: () => controller.bookmarkNavToPdf(
                          box.getAt(index)!.pdfUrl.toString(),
                          box.getAt(index)!.pdfDefaultPage),
                    ),
                  );
                },
              );
            }
            return Center(
              child: FittedBox(
                child: Text(
                  "No BooksMark added yet",
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
