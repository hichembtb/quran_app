import 'package:get/get.dart';

class BookMarkController extends GetxController {
  late String filePath;
  late int defaultPage;
  @override
  void onInit() {
    filePath = Get.arguments["filePath"];
    defaultPage = Get.arguments["defaultPage"];
    super.onInit();
  }
}
