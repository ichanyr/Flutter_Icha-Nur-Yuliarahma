import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const MyHomePage(title: 'Bali Tour Guide'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text('About Us', style: TextStyle()),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[100],
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Contact Us', style: GoogleFonts.poppins()),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[100],
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[100],
                    )),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    // ClipRRect(
                    //   borderRadius: BorderRadius.only(
                    //       bottomLeft: Radius.circular(10),
                    //       bottomRight: Radius.circular(10)),
                    child: Image(image: AssetImage('assets/images/pantai.jpg')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Text(
                                'Welcome to',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Tour Guide Service',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Temukan keindahan Bali dengan panduan ahli kami. Aplikasi jasa turguid kami memberikan pengalaman tak terlupakan, dengan rute kustom, rekomendasi terbaik, dan wawasan lokal.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Get Started',
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[100],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Align(alignment: Alignment.topLeft, child: Text('Name')),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child:
                    Align(alignment: Alignment.topLeft, child: Text('Email')),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child:
                    Align(alignment: Alignment.topLeft, child: Text('Message')),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.send),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Send',
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'About Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('List of Places',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Image(
                          image: AssetImage('assets/images/pantai.jpg'),
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Text(
                        'Melasti Beach',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Jalan Raya Kuta 2, Kuta')
                    ]),
                  ),
                  Card(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Image(
                          image: AssetImage('assets/images/seminyak.jpg'),
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Text(
                        'Seminyak Beach',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Jl. Double Six ')
                    ]),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Card(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Image(
                        image: AssetImage('assets/images/uluwatu.jpg'),
                        width: 122,
                        height: 122,
                      ),
                    ),
                    Text(
                      'Uluwatu',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Pecatu,Kuta Selatan')
                  ]),
                ),
                Card(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Image(
                        image: AssetImage('assets/images/ubud.jpg'),
                        width: 118,
                        height: 118,
                      ),
                    ),
                    Text(
                      'Ubud',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Jl. Monkey Forest'),
                  ],
                )),
              ])
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ]));
  }
}
