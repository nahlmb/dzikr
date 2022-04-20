import 'package:dzikr/data/quran_data/quran_data_model/quran_page_model.dart';

class QuranPage {
  QuranPage(
      {required this.lines, required this.pageNumber, required this.verses});
  List<QuranLineResultModel> lines;
  QuranVersesResultModel verses;
  int pageNumber;
}

class QuranVersesResultModel {
  QuranVersesResultModel({required this.verses});
  List<Verses>? verses;
}

class QuranLineResultModel {
  QuranLineResultModel(
      {required this.words,
      this.isUsingLineStretch = true,
      this.isBasmallah = false,
      this.isSurahBegining = false,
      this.surahNum = 0,
      this.fontSize = 0.054});
  List<Words> words;
  bool isUsingLineStretch;
  bool isBasmallah;
  bool isSurahBegining;
  int surahNum;
  double fontSize;
}
