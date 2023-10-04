import 'package:flutter/material.dart';
import 'package:prioritas2/controllers/galery_manager.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const GalleryList());
}

class GalleryList extends StatelessWidget {
  const GalleryList();

  //fungsi untuk menampilkan bottomsheet
  void _showOptions(BuildContext context, String imagePath) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(); // Tutup BottomSheet
                          },
                          child: Text(
                            'TIDAK',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            _navigateToNewPage(
                                context, imagePath); // Pergi ke halaman baru
                          },
                          child: Text(
                            'YA',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // fungsi untuk pindah ke halaman baru
  void _navigateToNewPage(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final galeryManager = Provider.of<GaleryManager>(context,
        listen:
            false); // untuk mengakses method yang ada di file contact_manager.dart
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Galeri'),
        centerTitle: true,
      ),
      body: Consumer<GaleryManager>(builder: (context, value, child) {
        if (value.galerysModel.isNotEmpty) {
          return GridView.count(
            crossAxisCount: 2,
            children: value.galerysModel.map((galery) {
              return GestureDetector(
                onTap: () {
                  _showOptions(context, galery.image);
                },
                child: Card(
                  child: Image.asset(
                    galery.image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: Text('Tidak ada gambar'),
          );
        }
      }),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final galeryManager = Provider.of<GaleryManager>(context,
        listen:
            false); // untuk mengakses method yang ada di file contact_manager.dart
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Baru'),
      ),
      body: Center(
          child: Image.asset(
        galeryManager.galerysModel[0].image,
        fit: BoxFit.cover,
      )),
    );
  }
}
