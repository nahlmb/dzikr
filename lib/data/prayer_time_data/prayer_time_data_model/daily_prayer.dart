import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/closest_prayer.dart';

class DailyPrayer {
  DailyPrayer(
      {required this.fajr,
      required this.dzhur,
      required this.ashar,
      required this.maghrib,
      required this.isya,
      required this.closestPrayer});
  String fajr, dzhur, ashar, maghrib, isya;
  ClosestPrayer closestPrayer;
}
