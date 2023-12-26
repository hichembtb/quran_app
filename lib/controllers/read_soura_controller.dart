import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../core/constant/constant/variables.dart';
import '../core/shared/widget/bottom_sheet.dart';
import '../models/bookmark_model.dart';
import '../models/quran_model.dart';

class ReadSouraController extends GetxController {
  File? file;
  String? name;
  int? surahIndex;
  int? pdfDefPage;
  bool isMarked = false;

  bool isBookMarked() {
    Hive.box<BookMark>(kBookMarkBox).values.forEach((element) {
      if (surahIndex == element.surahIndex) {
        isMarked = true;
        update();
      }
    });
    return isMarked;
  }

  @override
  void onInit() {
    file = Get.arguments["file"];
    name = Get.arguments["name"];
    surahIndex = Get.arguments["sourahIndex"];
    isBookMarked();
    super.onInit();
  }

  void navToAudio(String route, QuranModel sourahName) {
    Get.toNamed(route, arguments: {"sourahName": sourahName});
  }

  Future addToBookmark() async {
    if (isMarked == false) {
      // ! add to box
      Hive.box<BookMark>(kBookMarkBox).add(
        BookMark(
          surahIndex: surahIndex,
          pdfUrl: file!.path,
          pdfDefaultPage: pdfDefPage!,
        ),
      );
      isMarked = true;
      update();
    } else {
      inBookmarkBottomSheet();
    }
  }
}
