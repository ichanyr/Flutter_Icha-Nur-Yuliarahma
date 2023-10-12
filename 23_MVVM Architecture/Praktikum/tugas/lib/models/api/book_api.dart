import 'package:dio/dio.dart';
import 'package:tugas/models/book_model.dart';

class BookAPI {
  static Future<List<BookModel>> getBooks() async {
    final response = await Dio().get(
      "https://bookapi-1-v1905306.deta.app/api/v1/books/",
    );

    List<BookModel> books = (response.data as List)
        .map(
          (e) => BookModel(
            bookId: e['book_id'],
            title: e['title'],
            year: e['year'],
          ),
        )
        .toList();
    return books;
  }
}
