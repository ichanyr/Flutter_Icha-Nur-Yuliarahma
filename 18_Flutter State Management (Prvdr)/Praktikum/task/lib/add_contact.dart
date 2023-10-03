import 'package:flutter/material.dart';
import 'package:task/contact.dart';
import 'package:task/contact_list.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  // mendeklarasikan variabel dengan nama formKey yang memiliki tipe GlobalKey<FormState>.
  var formKey = GlobalKey<FormState>();

  // mendeklarasikan varibel dengan nama _nameController dan _phoneController yang memiliki tipe TextEditingController.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? name = "";
  int? number;

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
    final contactProvider = Provider.of<Contact>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Add Contact'),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Form(
                        key: formKey,
                        child: Column(children: [
                          // TextFormField Nama
                          TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter Name',
                              ),
                              validator: (value) {
                                name = value;
                                List<String> words = value!.split(' ');
                                for (var word in words) {
                                  // memeriksa apakah panjang kata kurang dari 2 karakter
                                  if (word.length < 2 ||
                                      // memeriksa apakah kata dimulai dengan huruf kapital. Jika salah satu kondisi ini terpenuhi, validator akan mengembalikan pesan kesalahan
                                      !word.startsWith(RegExp(r'[A-Z]'))) {
                                    return 'Name must consist of at least 2 words with each word starting with a capital letter';
                                  }
                                }

                                // Memeriksa apakah nilai yang dimasukkan kosong atau null. Jika iya, validator akan mengembalikan pesan "Please enter name".
                                if (value.isEmpty) {
                                  return 'Please enter name';
                                }
                                // Memeriksa apakah nilai mengandung karakter khusus atau angka. Jika iya, validator akan mengembalikan pesan "Name cannot contain numbers or special characters".
                                if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]')
                                    .hasMatch(value)) {
                                  return 'Name cannot contain numbers or special characters';
                                }
                                // Jika tidak ada masalah dengan validasi, validator akan mengembalikan null, menunjukkan bahwa validasi berhasil.
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          // TextFormField Phone Number
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Number Phone',
                              hintText: 'Enter Phone Number',
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
                            height: 16,
                          ),
                          buildDatePicker(context),
                          const SizedBox(
                            height: 16,
                          ),
                          buildColorPicker(context),
                          const SizedBox(
                            height: 16,
                          ),
                          buildFilePicker(context),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ElevatedButton(
                      //     child: const Text('Save'),
                      //     onPressed: () {
                      //       if (formKey.currentState!.validate()) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //             content: Text('Data saved successfully'),
                      //           ),
                      //         );
                      ElevatedButton(
                        onPressed: () {
                          contactProvider.add({
                            'name': _nameController.text,
                            'phone': _phoneController.text,
                            'date': DateFormat('dd-MM-yyyy').format(_dueDate),
                            'color': _currentColor.value.toString(),
                            'file': _selectedFilePath!,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ContactList()));
                        },
                        child: Text('Save'),
                      )
                    ])))));
  }

  // contactProvider.add({
  //   'name': _nameController.text,
  //   'phone': _phoneController.text,
  //   'date': DateFormat('dd-MM-yyyy').format(_dueDate),
  //   'color': _currentColor.value.toString(),
  //   'file': _selectedFilePath!,
  // });
  // print(contactProvider.contacts);

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
              _pickFile();
            },
            child: Text('Choose and Open File'))
      ],
    );
  }
}
