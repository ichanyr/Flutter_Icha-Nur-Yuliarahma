import 'package:flutter/material.dart';
import 'package:prioritas2/models/contact_model.dart';

// berisi operasi CRUD
class ContactManager extends ChangeNotifier {
  // variabel/property untuk menyimpan data contact berupa tumpukan List<ContactModel>
  final _contacsModel = <ContactModel>[];
  // final List<ContactModel> _contactsmodel = [];

  // method untuk menambahkan data contact melalui getter ke dalam variable _contactsModel
  List<ContactModel> get contactsModel =>
      _contacsModel; // mendapatkan semua data pada var contactModel
  // List<ContactModel> get contactsmodel {
  //   return _contacsModel;
  // }

// method untuk menambahkan data contact melalui setter ke dalam variable _contactsModel
  void addContact(ContactModel contactModel) {
    _contacsModel.add(contactModel);
    notifyListeners(); // merupakan observable untuk mengupdate data pd UI
  }

  void deleteContact(int index) {
    _contacsModel.removeAt(index);
    notifyListeners();
  }

  void editContact(int index, String name, String phoneNumber, String date,
      Color color, String fileName) {
    _contacsModel[index] = ContactModel(
      name: name,
      phoneNumber: phoneNumber,
      date: date,
      color: color,
      fileName: fileName,
    );
    notifyListeners();
  }
}
