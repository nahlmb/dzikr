import 'package:dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:dzikr/data/book_data/book_data_provider/book_data_provider.dart';

class BookTool {
  BookDataProvider bookDataProvider =
      BookDataProvider(assetPath: 'assets/books');

  List<Book> plainData = [];

  BookTool._();

  Future _getPlainData() async {
    plainData = await bookDataProvider.getAllBooks();
  }

  static Future<BookTool> init() async {
    var bookTool = BookTool._();
    await bookTool._getPlainData();
    return bookTool;
  }

  getAllBook() {
    return _getPlainData();
  }

  Future<List<Book>> getDzikrBook() async {
    return await bookDataProvider.getDzikrBook();
  }

  Future<List<Book>> getDuaBook() async {
    return await bookDataProvider.getDuaBook();
  }
}
