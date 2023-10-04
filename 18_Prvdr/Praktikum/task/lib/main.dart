import 'package:flutter/material.dart';
import 'package:prioritas2/controllers/contact_manager.dart';
import 'package:prioritas2/controllers/galery_manager.dart';
import 'package:prioritas2/drawer_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactManager()),
        ChangeNotifierProvider(create: (context) => GaleryManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[200],
          title: Text(
            'Assets Task',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Assets Task'),
        ),
        drawer: DrawerList());
  }
}
