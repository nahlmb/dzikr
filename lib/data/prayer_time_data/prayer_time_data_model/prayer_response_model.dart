import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_daily_model.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_time_data_model.dart';

class PrayerTime {
  PrayerTime(
      {required this.monthlySchedule,
      required this.todaySchedule,
      required this.placeLat,
      required this.placeLong,
      required this.placeName});
  MonthlyPrayer monthlySchedule;
  DailyPrayer todaySchedule;
  String? placeLat;
  String? placeLong;
  String? placeName;
}
