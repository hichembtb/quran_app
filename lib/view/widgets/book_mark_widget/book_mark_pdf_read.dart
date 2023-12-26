import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '../../../controllers/bookmark_controller.dart';
import '../../../core/constant/colors/app_color.dart';
import '../../../core/shared/widget/appbar.dart';

class BookMarkPdf extends StatelessWidget {
  const BookMarkPdf({super.key});

  @override
  Widget build(BuildContext context) {
    BookMarkController bookMarkController = Get.put(BookMarkController());
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColor.kTransparentColor,
            appBar: kAppBar,
            body: PDFView(
              filePath: bookMarkController.filePath,
              defaultPage: bookMarkController.defaultPage,
              swipeHorizontal: true,
            ),
          ),
        ],
      ),
    );
  }
}
