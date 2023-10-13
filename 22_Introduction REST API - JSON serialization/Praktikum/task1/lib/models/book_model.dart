// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  final int year;
  final int bookId;
  final String title;

  BookModel({
    required this.year,
    required this.bookId,
    required this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        year: json["year"],
        bookId: json["book_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "book_id": bookId,
        "title": title,
      };
}
