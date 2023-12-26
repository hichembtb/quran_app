import 'package:get/get.dart';

import '../../../view/qibla/qibla.dart';
import '../../../view/screens/bookmark_list.dart';
import '../../../view/screens/home_page.dart';
import '../../../view/screens/prayer_list.dart';
import '../../../view/screens/quran_audio.dart';
import '../../../view/screens/quran_list.dart';
import '../../../view/widgets/book_mark_widget/book_mark_pdf_read.dart';
import '../../../view/widgets/quran_widgets/read_soura.dart';
import 'app_routes.dart';

List<GetPage<dynamic>>? getPages = [
  // ? Home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  //! Quran List
  GetPage(
    name: AppRoute.quranlist,
    page: () => const QuranList(),
  ),

  //! Read Quran
  GetPage(
    name: AppRoute.readsoura,
    page: () => const ReadSoura(),
  ),

  //! Prayer Time
  GetPage(
    name: AppRoute.prayerList,
    page: () => const PrayerList(),
  ),

  //! QIBLA

  GetPage(
    name: AppRoute.qibla,
    page: () => const Qibla(),
  ),
  //! Quran Audio
  GetPage(
    name: AppRoute.quranaudio,
    page: () => const QuranAudio(),
  ),
  //! Quran BooksMark
  GetPage(
    name: AppRoute.quranbookmark,
    page: () => const BookMarkList(),
  ),
  //! Quran PDF BooksMark
  GetPage(
    name: AppRoute.quranPdfbookmark,
    page: () => const BookMarkPdf(),
  ),
];
