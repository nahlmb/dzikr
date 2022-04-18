class QuranChapterModel {
  List<Chapters>? chapters;

  QuranChapterModel({this.chapters});

  QuranChapterModel.fromJson(Map<String, dynamic> json) {
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chapters {
  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  TranslatedName? translatedName;

  Chapters(
      {this.id,
      this.revelationPlace,
      this.revelationOrder,
      this.bismillahPre,
      this.nameSimple,
      this.nameComplex,
      this.nameArabic,
      this.versesCount,
      this.pages,
      this.translatedName});

  Chapters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = json['pages'].cast<int>();
    translatedName = json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['revelation_place'] = this.revelationPlace;
    data['revelation_order'] = this.revelationOrder;
    data['bismillah_pre'] = this.bismillahPre;
    data['name_simple'] = this.nameSimple;
    data['name_complex'] = this.nameComplex;
    data['name_arabic'] = this.nameArabic;
    data['verses_count'] = this.versesCount;
    data['pages'] = this.pages;
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName!.toJson();
    }
    return data;
  }
}

class TranslatedName {
  String? languageName;
  String? name;

  TranslatedName({this.languageName, this.name});

  TranslatedName.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_name'] = this.languageName;
    data['name'] = this.name;
    return data;
  }
}
