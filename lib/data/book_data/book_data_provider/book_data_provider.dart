import 'dart:convert';

import 'package:dzikr/core/class/dzikr_provider_class.dart';
import 'package:dzikr/core/config/dzikr_network_config.dart';
import 'package:dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:flutter/services.dart';

class BookDataProvider extends DzikrProviderClass {
  BookDataProvider({required this.assetPath})
      : super(networkConfig: DzikrNetworkConfig(baseUrl: ''));

  final String assetPath;

  Future<List<Book>> getAllBooks() async {
    List<Book> list = [];
    list.addAll(await getDuaBook());
    list.addAll(await getDzikrBook());
    return list;
  }

  Future<List<Book>> getDzikrBook() async {
    var eveningDzikr = Book.fromJson(await jsonDecode(
        await rootBundle.loadString('$assetPath/evening-dzikr.json')));
    var morningDzikr = Book.fromJson(await jsonDecode(
        await rootBundle.loadString('$assetPath/morning-dzikr.json')));
    return [eveningDzikr, morningDzikr];
  }

  Future<List<Book>> getDuaBook() async {
    var quranDua = Book.fromJson(await jsonDecode(
        await rootBundle.loadString('$assetPath/quran-dua.json')));
    var dailyDua = Book.fromJson(await jsonDecode(
        await rootBundle.loadString('$assetPath/daily-dua.json')));

    return [quranDua, dailyDua];
  }
}
