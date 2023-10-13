import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/screens/booklist_screen.dart';
import 'package:tugas/screens/booklist_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: const BookListScreen(title: 'MVVM'),
      ),
    );
  }
}
