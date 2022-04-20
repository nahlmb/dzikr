import 'package:dzikr/data/book_data/book_data_model/book.dart';
import 'package:dzikr/data/book_data/book_data_provider/book_data_provider.dart';

/// Tool for showing (Islamic) texts
/// For now [BookTool] is containing Adzkar texts and Du'a texts
///
/// Init [BookTool] by it's own intializer :
///```dart
/// BookTool.init();
/// ```
///
/// Get all Books by :
/// ```dart
/// getAllBook();
/// ```
///
/// [BookTool] is part of Dzikr Package
class BookTool {
  BookDataProvider bookDataProvider =
      BookDataProvider(assetPath: 'assets/books');

  BookTool._();

  static BookTool init() {
    var bookTool = BookTool._();
    return bookTool;
  }

  Future<List<Book>> getAllBook() {
    return bookDataProvider.getAllBooks();
  }

  Future<List<Book>> getDzikrBook() async {
    return await bookDataProvider.getDzikrBook();
  }

  Future<List<Book>> getDuaBook() async {
    return await bookDataProvider.getDuaBook();
  }
}
