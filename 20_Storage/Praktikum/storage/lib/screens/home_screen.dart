import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/screens/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences loginData;
  String username = "";

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString("username")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  loginData.setBool("login", true);
                  loginData.remove("username");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.logout_outlined))
          ],
          title: const Text("Create New Contact"),
          elevation: 0,
          centerTitle: true,
          leading: Icon(Icons.phone_android_rounded),
          backgroundColor: Color(0XFF22668D),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text("Selamat Datang"),
              const SizedBox(height: 20),
              Text("Welcome $username",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
              // const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                child: Column(
                  children: [
                    // Icon(Icons.mobile_friendly_rounded),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(
                    //   'Create New Contacts',
                    //   style: TextStyle(
                    //       fontSize: 24, fontWeight: FontWeight.w400),
                    // ),
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
                    SingleChildScrollView(child: AddContacts()),
                  ],
                ),
              ),
            ],
          )),
        ));
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
      _selectedDate = dataList[index].date ?? DateTime.now();
      _currentColor = dataList[index].color ?? Color(0XFF22668D);
      _selectedFilePath = dataList[index].filePath;
      _editingIndex = index;
    });
  }

  int _editingIndex = -1;

// menambahkan varible dueDate dan currentDate
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  // variabel untuk menyimpan tanggal
  DateTime _selectedDate = DateTime.now();

  // menambahkan variable currentColor
  Color _currentColor = Color(0XFF22668D);
  // variabel untuk menyimpan warna
  Color _selectedColor = Color(0XFF22668D);

  // method pickFile
  void _pickFile() async {
    // variable result
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["png"],
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
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  name = value;
                  List<String> words = value!.split(' ');

                  if (words.length != 2) {
                    return 'Name must consist of exactly 2 words';
                  }

                  for (var word in words) {
                    if (word.length < 2 || !word.startsWith(RegExp(r'[A-Z]'))) {
                      return 'Each word must start with a capital letter and have at least 2 characters';
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
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
            const SizedBox(
              height: 8,
            ),
            buildDatePicker(context),
            SizedBox(
              height: 8,
            ),
            buildColorPicker(context),
            SizedBox(
              height: 8,
            ),
            buildFilePicker(context),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data saved successfully')));
                  if (name != null && number != null) {
                    if (_editingIndex != -1) {
                      // If _editingIndex is not -1, it means we're in edit mode
                      dataList[_editingIndex] = Data(
                        name: name,
                        number: number,
                        date: _selectedDate,
                        color: _currentColor,
                        filePath: _selectedFilePath,
                      );
                      _editingIndex = -1; // Reset _editingIndex after editing
                    } else {
                      dataList.add(Data(
                        name: name,
                        number: number,
                        date: _selectedDate,
                        color: _currentColor,
                        filePath: _selectedFilePath,
                      ));
                    }
                  }

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

                  setState(() {});

                  formKey.currentState!.save();
                  nameController.clear();
                  phoneNumberController.clear();
                }
              },
              child: Text('Save'),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 35)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0XFF22668D),
                ),
              ),
            ),
          ],
        )),
      ),
      const SizedBox(
        height: 24,
      ),
      const Text(
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
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataList[i].name.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      dataList[i].number.toString(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Tampilkan tanggal
                    Text(
                      'Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      children: [
                        const Text('Color: '),
                        Container(
                            height: 10, // Atur tinggi container keinginan Anda
                            width: 10, // Atur lebar container keinginan Anda
                            decoration: BoxDecoration(
                              color: _currentColor,
                              borderRadius: BorderRadius.circular(2),
                            )),
                      ],
                    ),

                    const SizedBox(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            child: Text('Choose Color'),
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
                            }));
                  });
            }),
        Container(
          height: 37,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentColor,
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Row(
      children: [
        Text('Choose File'),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 70,
        ),
        ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: Text('Choose and Open File'))
      ],
    );
  }
}

class Data {
  final String? name;
  final int? number;
  final DateTime? date;
  final Color? color;
  final String? filePath;

  Data({this.name, this.number, this.date, this.color, this.filePath});
}
