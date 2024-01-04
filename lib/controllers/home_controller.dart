import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path/path.dart';

import '../core/constant/colors/app_color.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/services/api/api_services.dart';
import '../core/services/pdf_service.dart';

class HomeController extends GetxController {
  // ! API SERVICE
  ApiServices apiServices = ApiServices();
  // ! API SERVICE
  bool? isInternet;
  File? file;
  String? name;
  readSoura(String url, int sourahIndex) async {
    isInternet = await InternetConnectionChecker().hasConnection;
    if (isInternet == false) {
      Get.defaultDialog(
        title: 'No Internet',
        content: const Icon(
          Icons.error,
          color: AppColor.kRedColor,
        ),
        backgroundColor: AppColor.kBlueColor,
      );
    } else {
      Get.defaultDialog(
        title: 'opening',
        content: const CircularProgressIndicator(color: AppColor.kRedColor),
        backgroundColor: AppColor.kBlueColor,
      );
      file = await PdfService.loadFirebase(url);

      if (file == null) return;
      name = basename("${file!.path}.pdf");

      Get.back();
      openPdf(sourahIndex);
    }
  }

  openPdf(int sourahIndex) {
    Get.toNamed(
      AppRoute.readsoura,
      arguments: {
        "file": file,
        "name": name,
        "sourahIndex": sourahIndex,
      },
    );
  }

  void navTo(String route) {
    Get.toNamed(
      route,
    );
  }

  void bookmarkNavToPdf(String bookPdfFile, int pdfDefPage) {
    Get.toNamed(AppRoute.quranPdfbookmark, arguments: {
      "filePath": bookPdfFile,
      "defaultPage": pdfDefPage,
    });
  }
}
