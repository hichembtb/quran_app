class DayAyaModel {
  final String? arText;
  final String? frTran;
  final String? surEnName;
  final int? surNumber;

  DayAyaModel({this.arText, this.frTran, this.surEnName, this.surNumber});
  factory DayAyaModel.fromJson(Map<String, dynamic> json) {
    return DayAyaModel(
      arText: json["data"][0]["text"],
      frTran: json["data"][1]["text"],
      surEnName: json["data"][1]["surah"]["englishName"],
      surNumber: json["data"][1]["numberInSurah"],
    );
  }
}
