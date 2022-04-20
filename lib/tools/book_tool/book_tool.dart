import 'package:dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:dzikr/data/book_data/book_data_provider/book_data_provider.dart';

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
