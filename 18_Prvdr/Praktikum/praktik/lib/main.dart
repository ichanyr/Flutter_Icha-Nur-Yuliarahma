import 'package:flutter/material.dart';
import 'package:praktik/add_contact.dart';
import 'package:praktik/contact.dart';
import 'package:praktik/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Contact()),
    ChangeNotifierProvider(create: (_) => User()),
  ], child: const MyApp()));
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
      home: const MyHomePage(title: 'Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             number = number + 1;
      //           });
      //         },
      //         child: Text('Tambah'),
      //       ),
      //       Text('$number')
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddContacts()));
        },
        child: Icon(Icons.add),
      ),
      // body: ListView.builder(
      //   itemCount: contactProvider.contacts.length,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text(contactProvider.contacts[index]['name']!),
      //     subtitle: Text(contactProvider.contacts[index]['phone']!),
      //   ),
      // ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WELCOME',
            style: TextStyle(fontSize: 45, color: Colors.purple[300]),
          ),
          SizedBox(
            height: 25,
          ),
          Icon(
            Icons.contact_mail,
            color: Colors.purple[300],
            size: 65,
          ),
        ],
      )),
    );
  }
}
