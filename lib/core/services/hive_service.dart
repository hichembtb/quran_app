import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/bookmark_model.dart';
import '../constant/constant/variables.dart';

class HiveService {
  //! INITIAL BOOK MARK DIRECTORY
  Future<void> initHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter<BookMark>(BookMarkAdapter());
    await Hive.openBox<BookMark>(kBookMarkBox);
  }
}
