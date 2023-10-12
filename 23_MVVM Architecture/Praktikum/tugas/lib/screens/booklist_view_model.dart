import 'package:flutter/material.dart';
import 'package:tugas/models/api/book_api.dart';
import 'package:tugas/models/book_model.dart';

class BookViewModel with ChangeNotifier {
  List<BookModel> _books = [];

  // Getter
  List<BookModel> get books => _books;

  // Setter
  getContacts() async {
    final b = await BookAPI.getBooks();
    _books = b;
    notifyListeners();
  }
}
