import 'package:flutter/material.dart';
import 'package:prioritas2/screens/galery_list.dart';
import 'package:prioritas2/screens/contacts.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  // Fungsi untuk membuka halaman Contacts
  void _openContacts() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Contacts()),
    );
  }

  // Fungsi untuk membuka halaman GalleryList
  void _openGalleryList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GalleryList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple[200],
        width: 200,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: _openContacts, // Buka Contacts saat tekan
                child: Text(
                  'Contacts',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: _openGalleryList, // Buka Contacts saat tekan
                child: Text(
                  'Galery List',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ]),
          ),
        ));
  }
}
