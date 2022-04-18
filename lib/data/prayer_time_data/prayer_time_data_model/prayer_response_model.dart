import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_daily_model.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_time_data_model.dart';

class PrayerResponseModel {
  PrayerResponseModel(
      {required this.monthlySchedule,
      required this.todaySchedule,
      required this.placeLat,
      required this.placeLong,
      required this.placeName});
  PrayerTimeDataModel monthlySchedule;
  PrayerDailyModel todaySchedule;
  String? placeLat;
  String? placeLong;
  String? placeName;
}
