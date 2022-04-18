import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_closest_model.dart';

class PrayerDailyModel {
  PrayerDailyModel(
      {required this.fajr,
      required this.dzhur,
      required this.ashar,
      required this.maghrib,
      required this.isya,
      required this.closestPrayerTime});
  String fajr, dzhur, ashar, maghrib, isya;
  PrayerClosestModel closestPrayerTime;
}
