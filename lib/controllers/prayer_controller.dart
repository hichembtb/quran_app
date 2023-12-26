import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PrayerController extends GetxController {
  Position? _currentPosition;
  double? latitude, longitude;
  Coordinates? coordinates;
  CalculationParameters? calculationMethod;
  PrayerTimes? prayerTimes;
  Future getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanetly denied , we cannot request permission');
    }
    _currentPosition = await Geolocator.getCurrentPosition();
    latitude = _currentPosition!.latitude;
    longitude = _currentPosition!.longitude;
    coordinates = Coordinates(latitude!, longitude!);
    calculationMethod = CalculationMethod.egyptian.getParameters();
    prayerTimes = PrayerTimes.today(
      coordinates!,
      calculationMethod!,
    );
  }
}
