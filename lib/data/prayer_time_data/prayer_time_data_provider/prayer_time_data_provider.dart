import 'package:dzikr/core/class/dzikr_provider_class.dart';
import 'package:dzikr/core/config/dzikr_error_config.dart';
import 'package:dzikr/core/config/dzikr_network_config.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/closest_prayer.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/daily_prayer.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/monthly_prayer.dart';
import 'package:intl/intl.dart';

class PrayerTimeDataProvider extends DzikrProviderClass {
  PrayerTimeDataProvider()
      : super(
            networkConfig:
                DzikrNetworkConfig(baseUrl: "http://api.aladhan.com/v1"));

  Future<MonthlyPrayer> getMonthlyPrayerTime(String lat, String long) async {
    var date = DateTime.now();
    var month = DateFormat('M').format(date);
    var year = DateFormat('yyyy').format(date);
    var response = await networkConfig.doGet(
        '/calendar?latitude=$lat&longitude=$long&method=4&month=$month&year=$year');

    return MonthlyPrayer.fromJson(response);
  }

  Data getTodayPrayerTime({required MonthlyPrayer monthlySchedule}) {
    var date = DateTime.now();
    String nowDate = DateFormat('dd-MM-yyyy').format(date);
    if (monthlySchedule.data == null) {
      throw DzikrErrorConfig(
          DzikrErrorConfig.causeNull, "Monthly schedule data is null");
    }
    var todayData = monthlySchedule.data!
        .firstWhere((element) => element.date!.gregorian!.date == nowDate);

    return todayData;
  }

  Data getTomorrowPrayerTime({required MonthlyPrayer monthlySchedule}) {
    var date = DateTime.now();
    date.add(const Duration(days: 1));
    String nowDate = DateFormat('dd-MM-yyyy').format(date);
    if (monthlySchedule.data == null) {
      throw DzikrErrorConfig(
          DzikrErrorConfig.causeNull, "Monthly schedule data is null");
    }
    var todayData = monthlySchedule.data!
        .firstWhere((element) => element.date!.gregorian!.date == nowDate);

    return todayData;
  }

  DailyPrayer findClosestPrayerTime(Data todayData, Data tomorrow) {
    // Find closest prayer time
    var date = DateTime.now();
    var format = DateFormat("HH:mm");
    var currentTime =
        format.parse(format.format(date)).millisecondsSinceEpoch.abs();
    var todayTimings = todayData.timings!;
    var tomorrowTimings = tomorrow.timings!;

    //change all prayer time to milliseconds
    // int fajr = format
    //     .parse(todayTimings.fajr!.substring(0, 5))
    //     .millisecondsSinceEpoch
    //     .abs();
    int dhuhr = format
        .parse(todayTimings.dhuhr!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    int asr = format
        .parse(todayTimings.asr!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    int maghrib = format
        .parse(todayTimings.maghrib!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    int isya = format
        .parse(todayTimings.isha!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();

    String closestPrayer = "";
    String closestPrayerTime = "0:00 (---)";

    if (dhuhr >= currentTime) {
      closestPrayer = "Dzuhur";
      closestPrayerTime = todayTimings.dhuhr!;
    } else if (dhuhr <= currentTime && asr >= currentTime) {
      closestPrayer = "Ashar";
      closestPrayerTime = todayTimings.asr!;
    } else if (asr <= currentTime && maghrib >= currentTime) {
      closestPrayer = "Maghrib";
      closestPrayerTime = todayTimings.maghrib!;
    } else if (maghrib <= currentTime && isya >= currentTime) {
      closestPrayer = "Isya";
      closestPrayerTime = todayTimings.isha!;
    } else if (isya <= currentTime) {
      closestPrayer = "Subuh";
      date = date.add(const Duration(days: 1));
      closestPrayerTime = tomorrowTimings.fajr!;
    }

    var closestDate = format.parse(closestPrayerTime.substring(0, 5));

    var closestDateExac = DateTime.utc(
      date.year,
      date.month,
      date.day,
      closestDate.hour,
      closestDate.minute,
    );

    var now = DateTime.now();

    var closestDateDiffrance = closestDateExac.difference(
        DateTime.utc(now.year, now.month, now.day, now.hour, now.minute));

    print(closestDateDiffrance.toString());

    return DailyPrayer(
        fajr: todayTimings.fajr!,
        dzhur: todayTimings.dhuhr!,
        ashar: todayTimings.asr!,
        maghrib: todayTimings.maghrib!,
        isya: todayTimings.isha!,
        closestPrayer: ClosestPrayer(
            closestPrayer: closestPrayer,
            closestTime: closestPrayerTime,
            durationToClosestPrayer: closestDateDiffrance));
  }
}
