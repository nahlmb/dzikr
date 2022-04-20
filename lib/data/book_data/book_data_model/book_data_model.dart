class Book {
  String? title;
  String? titleId;
  String? mainType;
  List<String>? lang;
  List<Collection>? collection;

  Book({this.title, this.titleId, this.mainType, this.lang, this.collection});

  Book.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleId = json['title-id'];
    mainType = json['main-type'];
    lang = json['lang'].cast<String>();
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['title-id'] = titleId;
    data['main-type'] = mainType;
    data['lang'] = lang;
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collection {
  String? title;
  String? titleId;
  List<Content>? content;

  Collection({this.title, this.titleId, this.content});

  Collection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleId = json['title-id'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['title-id'] = titleId;
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? ar;
  String? en;
  String? id;
  int? count;
  String? type;
  String? notes;

  Content({this.ar, this.en, this.id, this.count, this.type, this.notes});

  Content.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    id = json['id'];
    count = json['count'];
    type = json['type'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    data['id'] = id;
    data['count'] = count;
    data['type'] = type;
    data['notes'] = notes;
    return data;
  }
}
