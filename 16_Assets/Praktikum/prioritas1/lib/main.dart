import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const GalleryList(),
    );
  }
}

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
        builder: (context) => NewPage(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Galeri'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              _showOptions(context, 'assets/images/alterralogo.png');
            },
            child: Image.asset('assets/images/alterralogo.png'),
          ),
          GestureDetector(
            onTap: () {
              _showOptions(context, 'assets/images/flutterlogo.jpg');
            },
            child: Image.asset('assets/images/flutterlogo.jpg'),
          ),
          GestureDetector(
            onTap: () {
              _showOptions(context, 'assets/images/logodart.jpg');
            },
            child: Image.asset('assets/images/logodart.jpg'),
          ),
          GestureDetector(
            onTap: () {
              _showOptions(context, 'assets/images/androidstudiologo.png');
            },
            child: Image.asset('assets/images/androidstudiologo.png'),
          ),
          GestureDetector(
            onTap: () {
              _showOptions(context, 'assets/images/logovscode.png');
            },
            child: Image.asset('assets/images/logovscode.png'),
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String imagePath;

  const NewPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Baru'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
