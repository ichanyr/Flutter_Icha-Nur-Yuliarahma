import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FetchImage(),
    );
  }
}

class FetchImage extends StatefulWidget {
  const FetchImage({Key? key}) : super(key: key);

  @override
  _FetchImageState createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  final List<String> imageUrls = [
    'https://api.dicebear.com/7.x/bottts/svg',
    'https://api.dicebear.com/7.x/pixel-art/svg?seed=John',
    'https://api.dicebear.com/7.x/lorelei/svg?flip=true',
    'https://api.dicebear.com/7.x/pixel-art/svg?seed=John&hair=short01,short02,short03,short04,short05'
  ];

  List<String> loadImages = [];

  @override
  void initState() {
    super.initState();
    fetchDiceBearImage();
  }

  Future<void> fetchDiceBearImage() async {
    for (final imageUrl in imageUrls) {
      try {
        final response = await Dio().get(imageUrl);
        if (response.statusCode == 200) {
          setState(() {
            loadImages.add(imageUrl);
          });
        } else {
          print('Failed to load image: $imageUrl');
        }
      } catch (error) {
        print('Error fetching image: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('REST API DiceBear',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          backgroundColor: Colors.purple[300],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 10, // Jarak antara kolom
            mainAxisSpacing: 10, // Jarak antara baris
            childAspectRatio: 1, // Rasio tinggi lebar untuk setiap item
          ),
          itemCount: loadImages.length,
          itemBuilder: (BuildContext context, int index) {
            return SvgPicture.network(
              loadImages[index],
              width: 150,
              height: 150,
            );
          },
        ));
  }
}
