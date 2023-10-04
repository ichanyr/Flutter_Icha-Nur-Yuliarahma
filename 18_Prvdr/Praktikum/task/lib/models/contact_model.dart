import 'package:flutter/material.dart';

class ContactModel {
  final String name;
  final String phoneNumber;
  final String date;
  final Color color;
  final String fileName;

  ContactModel({
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    required this.fileName,
  });
}
