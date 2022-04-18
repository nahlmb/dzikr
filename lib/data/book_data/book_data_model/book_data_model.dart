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
        collection!.add(new Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title-id'] = this.titleId;
    data['main-type'] = this.mainType;
    data['lang'] = this.lang;
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
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
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title-id'] = this.titleId;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    data['id'] = this.id;
    data['count'] = this.count;
    data['type'] = this.type;
    data['notes'] = this.notes;
    return data;
  }
}
