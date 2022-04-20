import 'package:dzikr/core/utils/quran_utils.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_chapter.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_juzs.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_page.dart';
import 'package:dzikr/data/quran_data/quran_data_provider/quran_data_provider.dart';

/// Tools for showing Quran Features on your Flutter App
///
/// Init it by :
/// ```dart
/// QuranTool.init();
/// ```
///
/// This tool contains method for :
/// - Get all Quran pages data
/// - Get Chapters in Quran
/// - Get Juzs in Quran
/// - Get last opened Quran page that showed to user by QuranPageReader
/// - Save last opened Quran page that QuranPageReader use to be default initial page to show to user
///
/// [QuranTool] is part of Dzikr Package
class QuranTool {
  QuranDataProvider quranDataProvider =
      QuranDataProvider(assetPath: 'assets/quran');

  QuranTool._();

  static QuranTool init() {
    QuranTool quranTool = QuranTool._();
    return quranTool;
  }

  Future<List<QuranPage>> getQuranPages() async {
    return await quranDataProvider.getCompleteResultQuranData();
  }

  Future<QuranChapters> getQuranChapter() async {
    return await quranDataProvider.getSurahList();
  }

  Future<QuranJuzs> getQuranJuzs() async {
    return await quranDataProvider.getJuzList();
  }

  static Future<Chapters> getQuranChapterByNum(int chapterNum) async {
    return await QuranUtils.getSurahByNumber(chapterNum);
  }

  Future<int> getLastOpenedPageIndex() async {
    return await quranDataProvider.getLastOpenedPageIndex();
  }

  Future setLastOpenedPageIndex(int page) async {
    return await quranDataProvider.setLastOpenedPageIndex(page);
  }
}
