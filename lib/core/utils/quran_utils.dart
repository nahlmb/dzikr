import 'package:dzikr/data/quran_data/quran_data_model/quran_chapter_model.dart';
import 'package:dzikr/data/quran_data/quran_data_provider/quran_data_provider.dart';

class QuranUtils {
  static Future<Chapters> getSurahByNumber(int surahNumber,
      {String assetPath = 'assets/quran'}) async {
    QuranDataProvider provider = QuranDataProvider(assetPath: assetPath);
    var surahList = await provider.getSurahList();
    return surahList.chapters!
        .firstWhere((element) => element.id == surahNumber);
  }
}
