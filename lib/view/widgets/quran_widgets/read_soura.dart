import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '../../../controllers/read_soura_controller.dart';
import '../../../core/configuration/size_config.dart';
import '../../../core/constant/colors/app_color.dart';
import '../../../core/constant/constant/variables.dart';
import '../../../core/constant/routes/app_routes.dart';
import '../../../core/shared/widget/appbar.dart';

class ReadSoura extends StatelessWidget {
  const ReadSoura({super.key});

  @override
  Widget build(BuildContext context) {
    ReadSouraController readSouraController = Get.put(ReadSouraController());
    SizeConfig().init(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kPrimaryColor,
        onPressed: () => readSouraController.navToAudio(
            AppRoute.quranaudio, quranMap[readSouraController.surahIndex]!),
        child: const Icon(Icons.audiotrack),
      ),
      body: Stack(
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColor.kTransparentColor,
            appBar: kAppBar,
            body: PDFView(
              filePath: readSouraController.file!.path,
              onPageChanged: (page, total) =>
                  readSouraController.pdfDefPage = page,
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight! * 0.91,
            left: SizeConfig.screenWidth! * 0.05,
            child: RawMaterialButton(
              onPressed: () => readSouraController.addToBookmark(),
              fillColor: AppColor.kPrimaryColor,
              shape: const CircleBorder(),
              constraints: const BoxConstraints.tightFor(
                width: 56.0,
                height: 56.0,
              ),
              elevation: 2.0,
              child: GetBuilder<ReadSouraController>(
                builder: (buildContr) {
                  return Icon(
                    buildContr.isMarked == true
                        ? Icons.bookmark_added
                        : Icons.bookmark_add,
                    color: Colors.white,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
