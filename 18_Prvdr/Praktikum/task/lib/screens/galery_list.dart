import 'package:flutter/material.dart';
import 'package:prioritas2/controllers/galery_manager.dart';
import 'package:prioritas2/models/galery_model.dart';
import 'package:provider/provider.dart';

void main() {
  GaleryModel galeryManager = GaleryModel(imagePath: '');

  // Menambahkan gambar ke GaleryManager
  galeryManager
      .addGalery(GaleryModel(imagePath: 'assets/images/alterralogo.png'));
  runApp(const GalleryList());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: const GalleryList(),
//     );
//   }
// }

class GalleryList extends StatelessWidget {
  const GalleryList();

  //fungsi untuk menampilkan bottomsheet
  void _showOptions(BuildContext context, String imagePath) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _navigateToNewPage(
                          context, imagePath); // Pergi ke halaman baru
                    },
                    child: Text(
                      'YA',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
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
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            ],
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
                  _showOptions(context, galery.imagePath);
                },
                child: Card(
                  child: Image.asset(
                    galery.imagePath,
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
      body: Center(child: Image.asset(galeryManager.galerysModel[0].imagePath)),
    );
  }
}
