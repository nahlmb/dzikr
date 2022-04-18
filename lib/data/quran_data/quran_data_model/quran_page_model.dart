class QuranPageModel {
  List<Verses>? verses;
  Pagination? pagination;

  QuranPageModel({this.verses, this.pagination});

  QuranPageModel.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(new Verses.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Verses {
  int? id;
  int? verseNumber;
  String? verseKey;
  int? juzNumber;
  int? hizbNumber;
  int? rubElHizbNumber;
  int? rukuNumber;
  int? manzilNumber;
  Null? sajdahNumber;
  String? textUthmani;
  int? pageNumber;
  List<Words>? words;
  List<Translations>? translations;

  Verses(
      {this.id,
      this.verseNumber,
      this.verseKey,
      this.juzNumber,
      this.hizbNumber,
      this.rubElHizbNumber,
      this.rukuNumber,
      this.manzilNumber,
      this.sajdahNumber,
      this.textUthmani,
      this.pageNumber,
      this.words,
      this.translations});

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    verseKey = json['verse_key'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubElHizbNumber = json['rub_el_hizb_number'];
    rukuNumber = json['ruku_number'];
    manzilNumber = json['manzil_number'];
    sajdahNumber = json['sajdah_number'];
    textUthmani = json['text_uthmani'];
    pageNumber = json['page_number'];
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words!.add(new Words.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['verse_number'] = this.verseNumber;
    data['verse_key'] = this.verseKey;
    data['juz_number'] = this.juzNumber;
    data['hizb_number'] = this.hizbNumber;
    data['rub_el_hizb_number'] = this.rubElHizbNumber;
    data['ruku_number'] = this.rukuNumber;
    data['manzil_number'] = this.manzilNumber;
    data['sajdah_number'] = this.sajdahNumber;
    data['text_uthmani'] = this.textUthmani;
    data['page_number'] = this.pageNumber;
    if (this.words != null) {
      data['words'] = this.words!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
  int? id;
  int? position;
  String? audioUrl;
  String? qpcUthmaniHafs;
  String? charTypeName;
  int? pageNumber;
  int? lineNumber;
  String? text;
  Translation? translation;
  Translation? transliteration;

  Words(
      {this.id,
      this.position,
      this.audioUrl,
      this.qpcUthmaniHafs,
      this.charTypeName,
      this.pageNumber,
      this.lineNumber,
      this.text,
      this.translation,
      this.transliteration});

  Words.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    audioUrl = json['audio_url'];
    qpcUthmaniHafs = json['qpc_uthmani_hafs'];
    charTypeName = json['char_type_name'];
    pageNumber = json['page_number'];
    lineNumber = json['line_number'];
    text = json['text'];
    translation = json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null;
    transliteration = json['transliteration'] != null
        ? new Translation.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    data['audio_url'] = this.audioUrl;
    data['qpc_uthmani_hafs'] = this.qpcUthmaniHafs;
    data['char_type_name'] = this.charTypeName;
    data['page_number'] = this.pageNumber;
    data['line_number'] = this.lineNumber;
    data['text'] = this.text;
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration!.toJson();
    }
    return data;
  }
}

class Translation {
  String? text;
  String? languageName;
  int? languageId;

  Translation({this.text, this.languageName, this.languageId});

  Translation.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageName = json['language_name'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['language_name'] = this.languageName;
    data['language_id'] = this.languageId;
    return data;
  }
}

class Translations {
  int? id;
  int? resourceId;
  String? text;

  Translations({this.id, this.resourceId, this.text});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resourceId = json['resource_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resource_id'] = this.resourceId;
    data['text'] = this.text;
    return data;
  }
}

class Pagination {
  int? perPage;
  int? currentPage;
  Null? nextPage;
  int? totalPages;
  int? totalRecords;

  Pagination(
      {this.perPage,
      this.currentPage,
      this.nextPage,
      this.totalPages,
      this.totalRecords});

  Pagination.fromJson(Map<String, dynamic> json) {
    perPage = json['per_page'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    totalPages = json['total_pages'];
    totalRecords = json['total_records'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['next_page'] = this.nextPage;
    data['total_pages'] = this.totalPages;
    data['total_records'] = this.totalRecords;
    return data;
  }
}
