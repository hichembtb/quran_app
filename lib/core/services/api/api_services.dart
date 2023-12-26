import 'dart:convert';
import 'dart:math';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

import '../../../models/day_aya_model.dart';

class ApiServices {
  int random(min, max) {
    Random random = Random();
    return min + random.nextInt(max - min);
  }

  bool isInternet = false;
  Future<DayAyaModel> getAyaOfDay() async {
    isInternet = await InternetConnectionChecker().hasConnection;
    if (isInternet == true) {
      String apiUrl =
          "https://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,fr.hamidullah";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return DayAyaModel.fromJson(json.decode(response.body));
      } else {
        return DayAyaModel.fromJson({
          'arText': 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم',
          'frTran':
              "Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux.",
          'surEnName': 'Al-Faatiha',
          'surNumber': 1,
        });
      }
    } else {
      return DayAyaModel(
        arText: 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم',
        frTran:
            "Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux.",
        surEnName: 'Al-Faatiha',
        surNumber: 1,
      );
    }
  }
}
