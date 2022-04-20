class QuranPageResponse {
  List<Verses>? verses;
  Pagination? pagination;

  QuranPageResponse({this.verses, this.pagination});

  QuranPageResponse.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
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
  Object? sajdahNumber;
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
        words!.add(Words.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['verse_number'] = verseNumber;
    data['verse_key'] = verseKey;
    data['juz_number'] = juzNumber;
    data['hizb_number'] = hizbNumber;
    data['rub_el_hizb_number'] = rubElHizbNumber;
    data['ruku_number'] = rukuNumber;
    data['manzil_number'] = manzilNumber;
    data['sajdah_number'] = sajdahNumber;
    data['text_uthmani'] = textUthmani;
    data['page_number'] = pageNumber;
    if (words != null) {
      data['words'] = words!.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
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
        ? Translation.fromJson(json['translation'])
        : null;
    transliteration = json['transliteration'] != null
        ? Translation.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position'] = position;
    data['audio_url'] = audioUrl;
    data['qpc_uthmani_hafs'] = qpcUthmaniHafs;
    data['char_type_name'] = charTypeName;
    data['page_number'] = pageNumber;
    data['line_number'] = lineNumber;
    data['text'] = text;
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    if (transliteration != null) {
      data['transliteration'] = transliteration!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['language_name'] = languageName;
    data['language_id'] = languageId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['resource_id'] = resourceId;
    data['text'] = text;
    return data;
  }
}

class Pagination {
  int? perPage;
  int? currentPage;
  Object? nextPage;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['next_page'] = nextPage;
    data['total_pages'] = totalPages;
    data['total_records'] = totalRecords;
    return data;
  }
}
