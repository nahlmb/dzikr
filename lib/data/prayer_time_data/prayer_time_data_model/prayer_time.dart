import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/daily_prayer.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/monthly_prayer.dart';

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
