import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 0)
class BookMark {
  @HiveField(0)
  int? surahIndex;
  @HiveField(1)
  String? pdfUrl;
  @HiveField(2)
  int pdfDefaultPage;

  BookMark({
    required this.surahIndex,
    required this.pdfUrl,
    required this.pdfDefaultPage,
  });
}
