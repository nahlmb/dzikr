class QuranJuzs {
  List<Juzs>? juzs;

  QuranJuzs({this.juzs});

  QuranJuzs.fromJson(Map<String, dynamic> json) {
    if (json['juzs'] != null) {
      juzs = <Juzs>[];
      json['juzs'].forEach((v) {
        juzs!.add(Juzs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (juzs != null) {
      data['juzs'] = juzs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Juzs {
  int? id;
  int? juzNumber;
  VerseMapping? verseMapping;
  int? firstVerseId;
  int? lastVerseId;
  int? versesCount;

  Juzs(
      {this.id,
      this.juzNumber,
      this.verseMapping,
      this.firstVerseId,
      this.lastVerseId,
      this.versesCount});

  Juzs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    juzNumber = json['juz_number'];
    verseMapping = json['verse_mapping'] != null
        ? VerseMapping.fromJson(json['verse_mapping'])
        : null;
    firstVerseId = json['first_verse_id'];
    lastVerseId = json['last_verse_id'];
    versesCount = json['verses_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['juz_number'] = juzNumber;
    if (verseMapping != null) {
      data['verse_mapping'] = verseMapping!.toJson();
    }
    data['first_verse_id'] = firstVerseId;
    data['last_verse_id'] = lastVerseId;
    data['verses_count'] = versesCount;
    return data;
  }
}

class VerseMapping {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? s15;
  String? s16;
  String? s17;
  String? s18;
  String? s19;
  String? s20;
  String? s21;
  String? s22;
  String? s23;
  String? s24;
  String? s25;
  String? s26;
  String? s27;
  String? s28;
  String? s29;
  String? s30;
  String? s31;
  String? s32;
  String? s33;
  String? s34;
  String? s35;
  String? s36;
  String? s37;
  String? s38;
  String? s39;
  String? s40;
  String? s41;
  String? s42;
  String? s43;
  String? s44;
  String? s45;
  String? s46;
  String? s47;
  String? s48;
  String? s49;
  String? s50;
  String? s51;
  String? s52;
  String? s53;
  String? s54;
  String? s55;
  String? s56;
  String? s57;
  String? s58;
  String? s59;
  String? s60;
  String? s61;
  String? s62;
  String? s63;
  String? s64;
  String? s65;
  String? s66;
  String? s67;
  String? s68;
  String? s69;
  String? s70;
  String? s71;
  String? s72;
  String? s73;
  String? s74;
  String? s75;
  String? s76;
  String? s77;
  String? s78;
  String? s79;
  String? s80;
  String? s81;
  String? s82;
  String? s83;
  String? s84;
  String? s85;
  String? s86;
  String? s87;
  String? s88;
  String? s89;
  String? s90;
  String? s91;
  String? s92;
  String? s93;
  String? s94;
  String? s95;
  String? s96;
  String? s97;
  String? s98;
  String? s99;
  String? s100;
  String? s101;
  String? s102;
  String? s103;
  String? s104;
  String? s105;
  String? s106;
  String? s107;
  String? s108;
  String? s109;
  String? s110;
  String? s111;
  String? s112;
  String? s113;
  String? s114;

  VerseMapping(
      {this.s1,
      this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.s9,
      this.s10,
      this.s11,
      this.s12,
      this.s13,
      this.s14,
      this.s15,
      this.s16,
      this.s17,
      this.s18,
      this.s19,
      this.s20,
      this.s21,
      this.s22,
      this.s23,
      this.s24,
      this.s25,
      this.s26,
      this.s27,
      this.s28,
      this.s29,
      this.s30,
      this.s31,
      this.s32,
      this.s33,
      this.s34,
      this.s35,
      this.s36,
      this.s37,
      this.s38,
      this.s39,
      this.s40,
      this.s41,
      this.s42,
      this.s43,
      this.s44,
      this.s45,
      this.s46,
      this.s47,
      this.s48,
      this.s49,
      this.s50,
      this.s51,
      this.s52,
      this.s53,
      this.s54,
      this.s55,
      this.s56,
      this.s57,
      this.s58,
      this.s59,
      this.s60,
      this.s61,
      this.s62,
      this.s63,
      this.s64,
      this.s65,
      this.s66,
      this.s67,
      this.s68,
      this.s69,
      this.s70,
      this.s71,
      this.s72,
      this.s73,
      this.s74,
      this.s75,
      this.s76,
      this.s77,
      this.s78,
      this.s79,
      this.s80,
      this.s81,
      this.s82,
      this.s83,
      this.s84,
      this.s85,
      this.s86,
      this.s87,
      this.s88,
      this.s89,
      this.s90,
      this.s91,
      this.s92,
      this.s93,
      this.s94,
      this.s95,
      this.s96,
      this.s97,
      this.s98,
      this.s99,
      this.s100,
      this.s101,
      this.s102,
      this.s103,
      this.s104,
      this.s105,
      this.s106,
      this.s107,
      this.s108,
      this.s109,
      this.s110,
      this.s111,
      this.s112,
      this.s113,
      this.s114});

  VerseMapping.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    s17 = json['17'];
    s18 = json['18'];
    s19 = json['19'];
    s20 = json['20'];
    s21 = json['21'];
    s22 = json['22'];
    s23 = json['23'];
    s24 = json['24'];
    s25 = json['25'];
    s26 = json['26'];
    s27 = json['27'];
    s28 = json['28'];
    s29 = json['29'];
    s30 = json['30'];
    s31 = json['31'];
    s32 = json['32'];
    s33 = json['33'];
    s34 = json['34'];
    s35 = json['35'];
    s36 = json['36'];
    s37 = json['37'];
    s38 = json['38'];
    s39 = json['39'];
    s40 = json['40'];
    s41 = json['41'];
    s42 = json['42'];
    s43 = json['43'];
    s44 = json['44'];
    s45 = json['45'];
    s46 = json['46'];
    s47 = json['47'];
    s48 = json['48'];
    s49 = json['49'];
    s50 = json['50'];
    s51 = json['51'];
    s52 = json['52'];
    s53 = json['53'];
    s54 = json['54'];
    s55 = json['55'];
    s56 = json['56'];
    s57 = json['57'];
    s58 = json['58'];
    s59 = json['59'];
    s60 = json['60'];
    s61 = json['61'];
    s62 = json['62'];
    s63 = json['63'];
    s64 = json['64'];
    s65 = json['65'];
    s66 = json['66'];
    s67 = json['67'];
    s68 = json['68'];
    s69 = json['69'];
    s70 = json['70'];
    s71 = json['71'];
    s72 = json['72'];
    s73 = json['73'];
    s74 = json['74'];
    s75 = json['75'];
    s76 = json['76'];
    s77 = json['77'];
    s78 = json['78'];
    s79 = json['79'];
    s80 = json['80'];
    s81 = json['81'];
    s82 = json['82'];
    s83 = json['83'];
    s84 = json['84'];
    s85 = json['85'];
    s86 = json['86'];
    s87 = json['87'];
    s88 = json['88'];
    s89 = json['89'];
    s90 = json['90'];
    s91 = json['91'];
    s92 = json['92'];
    s93 = json['93'];
    s94 = json['94'];
    s95 = json['95'];
    s96 = json['96'];
    s97 = json['97'];
    s98 = json['98'];
    s99 = json['99'];
    s100 = json['100'];
    s101 = json['101'];
    s102 = json['102'];
    s103 = json['103'];
    s104 = json['104'];
    s105 = json['105'];
    s106 = json['106'];
    s107 = json['107'];
    s108 = json['108'];
    s109 = json['109'];
    s110 = json['110'];
    s111 = json['111'];
    s112 = json['112'];
    s113 = json['113'];
    s114 = json['114'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = s1;
    data['2'] = s2;
    data['3'] = s3;
    data['4'] = s4;
    data['5'] = s5;
    data['6'] = s6;
    data['7'] = s7;
    data['8'] = s8;
    data['9'] = s9;
    data['10'] = s10;
    data['11'] = s11;
    data['12'] = s12;
    data['13'] = s13;
    data['14'] = s14;
    data['15'] = s15;
    data['16'] = s16;
    data['17'] = s17;
    data['18'] = s18;
    data['19'] = s19;
    data['20'] = s20;
    data['21'] = s21;
    data['22'] = s22;
    data['23'] = s23;
    data['24'] = s24;
    data['25'] = s25;
    data['26'] = s26;
    data['27'] = s27;
    data['28'] = s28;
    data['29'] = s29;
    data['30'] = s30;
    data['31'] = s31;
    data['32'] = s32;
    data['33'] = s33;
    data['34'] = s34;
    data['35'] = s35;
    data['36'] = s36;
    data['37'] = s37;
    data['38'] = s38;
    data['39'] = s39;
    data['40'] = s40;
    data['41'] = s41;
    data['42'] = s42;
    data['43'] = s43;
    data['44'] = s44;
    data['45'] = s45;
    data['46'] = s46;
    data['47'] = s47;
    data['48'] = s48;
    data['49'] = s49;
    data['50'] = s50;
    data['51'] = s51;
    data['52'] = s52;
    data['53'] = s53;
    data['54'] = s54;
    data['55'] = s55;
    data['56'] = s56;
    data['57'] = s57;
    data['58'] = s58;
    data['59'] = s59;
    data['60'] = s60;
    data['61'] = s61;
    data['62'] = s62;
    data['63'] = s63;
    data['64'] = s64;
    data['65'] = s65;
    data['66'] = s66;
    data['67'] = s67;
    data['68'] = s68;
    data['69'] = s69;
    data['70'] = s70;
    data['71'] = s71;
    data['72'] = s72;
    data['73'] = s73;
    data['74'] = s74;
    data['75'] = s75;
    data['76'] = s76;
    data['77'] = s77;
    data['78'] = s78;
    data['79'] = s79;
    data['80'] = s80;
    data['81'] = s81;
    data['82'] = s82;
    data['83'] = s83;
    data['84'] = s84;
    data['85'] = s85;
    data['86'] = s86;
    data['87'] = s87;
    data['88'] = s88;
    data['89'] = s89;
    data['90'] = s90;
    data['91'] = s91;
    data['92'] = s92;
    data['93'] = s93;
    data['94'] = s94;
    data['95'] = s95;
    data['96'] = s96;
    data['97'] = s97;
    data['98'] = s98;
    data['99'] = s99;
    data['100'] = s100;
    data['101'] = s101;
    data['102'] = s102;
    data['103'] = s103;
    data['104'] = s104;
    data['105'] = s105;
    data['106'] = s106;
    data['107'] = s107;
    data['108'] = s108;
    data['109'] = s109;
    data['110'] = s110;
    data['111'] = s111;
    data['112'] = s112;
    data['113'] = s113;
    data['114'] = s114;
    return data;
  }
}
