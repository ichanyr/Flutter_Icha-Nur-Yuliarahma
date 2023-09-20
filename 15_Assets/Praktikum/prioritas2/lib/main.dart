import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:prioritas2/galery_list.dart';

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
          title: Text('Contacts'),
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
                    AddContacts(),
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

// menambahkan varible dueDate dan currentDate
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  // variabel untuk menyimpan tanggal
  DateTime _selectedDate = DateTime.now();

  // menambahkan variable currentColor
  Color _currentColor = Colors.yellow;
  // variabel untuk menyimpan warna
  Color _selectedColor = Colors.yellow;

  // method pickFile
  void _pickFile() async {
    // variable result
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg"],
    );
    if (result == null) return;

    // mendapatkan file dari object result
    final file = result.files.first;
    _openFile(file);
  }

  // variabel untuk menyimpan file path
  String? _selectedFilePath;

  // method openFile
  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
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
            buildDatePicker(context),
            buildColorPicker(context),
            buildFilePicker(context),
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
                              'subtitle2': _selectedDate,
                              'subtitle3': _selectedColor,
                              'subtitle4': _selectedFilePath,
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
            height: 120,
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
                    SizedBox(
                      height: 4,
                    ),
                    // Tampilkan tanggal
                    Text(
                      'Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text('Color: '),
                        Container(
                            height: 10, // Atur tinggi container keinginan Anda
                            width: 10, // Atur lebar container keinginan Anda
                            decoration: BoxDecoration(
                              color: _currentColor,
                              borderRadius: BorderRadius.circular(2),
                            )),
                      ],
                    ),

                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'File : $_selectedFilePath',
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

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date'),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if (selectDate != null) {
                      _dueDate = selectDate;
                    }
                  });
                },
                child: Text('Select'))
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color'),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentColor,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_currentColor)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Choose Your Color'),
                      content: BlockPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          }),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Save'))
                      ],
                    );
                  });
            },
            child: Text('Choose Color'),
          ),
        )
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      children: [
        Text('Choose File'),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            // _pickFile();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GalleryList(),
              ),
            );
          },
          child: Text('Choose and Open File'),
        )
      ],
    );
  }
}

class Data {
  final String? name;
  final int? number;

  Data({this.name, this.number});
}
