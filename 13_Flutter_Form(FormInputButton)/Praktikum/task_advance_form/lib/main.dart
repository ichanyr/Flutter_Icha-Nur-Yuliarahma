import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF22668D),
          title: Text('Interactive Widgets'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                child: Column(
                  children: [
                    Icon(Icons.mobile_friendly_rounded),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Create New Contacts',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        '''Dalam rangka memperluas jaringan dan menjaga komunikasi yang efisien, mari mencatat informasi kontak kolega Anda.'''),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AddContacts()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  var formKey = GlobalKey<FormState>();
  String? name = "";
  int? number;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  List<Data> dataList = [];

  void deleteContact(int index) {
    setState(() {
      dataList.removeAt(index);
    });
  }

  void editContact(int index) {
    setState(() {
      nameController.text = dataList[index].name ?? '';
      phoneNumberController.text = dataList[index].number.toString() ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Form(
        key: formKey,
        child: Container(
            child: Column(
          children: [
            TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  name = value;
                  List<String> words = value!.split(' ');
                  for (var word in words) {
                    if (word.length < 2 || !word.startsWith(RegExp(r'[A-Z]'))) {
                      return 'Name must consist of at least 2 words with each word starting with a capital letter';
                    }
                  }

                  // ignore: unnecessary_null_comparison
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Name cannot contain numbers or special characters';
                  }

                  return null;
                }),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                number = int.tryParse(value!);
                // ignore: unnecessary_null_comparison
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                }
                if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
                  return 'Phone number must start with 0 and be between 8 to 15 digits';
                }

                return null;
              },
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data saved successfully')));
                  dataList.add(Data(
                    name: name,
                    number: number,
                  ));
                  for (var i = 0; i < dataList.length; i++) {
                    print(dataList
                        .map((data) => {
                              'title': data.name,
                              'subtitle': data.number,
                            })
                        .toList());
                  }
                  // print(dataList);

                  setState(() {});

                  formKey.currentState!.save();
                  nameController.clear();
                  phoneNumberController.clear();
                }
              },
              child: Text('Save'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0XFF22668D),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
      SizedBox(
        height: 24,
      ),
      Text(
        'List Contacts',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
      for (var i = 0; i < dataList.length; i++)
        Column(children: [
          Container(
            width: double.infinity,
            height: 58,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Color(0XFF8ECDDD),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                CircleAvatar(
                  child: Text(dataList[i].name!.substring(0, 1)),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataList[i].name.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      dataList[i].number.toString(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      editContact(i);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      deleteContact(i);
                    },
                    icon: Icon(Icons.delete)),
              ]),
            ),
            // child: ListTile(
            //   title: Text(dataList[i].name.toString()),
            //   subtitle: Text(dataList[i].number.toString()),
            //   leading: CircleAvatar(
            //     child: Text(dataList[i].name!.substring(0, 1)),
            //     backgroundColor: Colors.white,
            //   ),
            //   trailing: IconButton(
            //     onPressed: () {},
            //     icon: IconButton(
            //         onPressed: () {
            //           deleteContact(i);
            //         },
            //         icon: Icon(Icons.delete)),
            //   ),
          ),
        ]),
    ]);
  }
}

class Data {
  final String? name;
  final int? number;

  Data({this.name, this.number});
}
