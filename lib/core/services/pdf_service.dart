import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../constant/colors/app_color.dart';

class PdfService {
  static Future<File?> loadFirebase(String url) async {
    Uint8List? bytes;

    Reference refPDF = FirebaseStorage.instance.ref("quran").child(url);

    try {
      bytes = await refPDF.getData();

      return _storeFile(url, bytes!);
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        Get.back();
        Get.defaultDialog(
          title: 'Soura Not avail',
          content: const Icon(
            Icons.error,
            color: AppColor.kRedColor,
          ),
          backgroundColor: AppColor.kBlueColor,
        );
      }
      return null;
    }
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
