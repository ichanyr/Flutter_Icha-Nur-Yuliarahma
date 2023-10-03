import 'package:flutter/material.dart';
import 'package:task/contact.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override

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

  // menambahkan varible dueDate dan currentDate
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  // variabel untuk menyimpan tanggal
  DateTime _selectedDate = DateTime.now();

  Widget build(BuildContext context) {
    // menambahkan variable currentColor
    Color _currentColor = Colors.yellow;
    // variabel untuk menyimpan warna
    Color _selectedColor = Colors.yellow;

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    final contactProvider = Provider.of<Contact>(context);

    void deleteContact(int index) {
      setState(() {
        contactProvider.contacts.removeAt(index);
      });
    }

    void editContact(int index) {
      setState(() {
        _nameController.text = contactProvider.contacts[index]['name'] ?? '';
        _phoneController.text = contactProvider.contacts[index]['phone'] ?? '';
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: contactProvider.contacts.length,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                CircleAvatar(
                  child: Text(contactProvider.contacts[index]['name']![0]),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contactProvider.contacts[index]['name']!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      contactProvider.contacts[index]['phone']!,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Tampilkan tanggal
                    Text(
                      contactProvider.contacts[index]['date']!,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text('Color: '),
                        Container(
                            height: 10, // Atur tinggi container keinginan Anda
                            width: 10, // Atur lebar container keinginan Anda
                            decoration: BoxDecoration(
                              color: _selectedColor,
                              borderRadius: BorderRadius.circular(2),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      contactProvider.contacts[index]['file']!,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      editContact(index);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      deleteContact(index);
                    },
                    icon: Icon(Icons.delete)),
              ]),
            ),

            // child: ListTile(
            //   trailing: Row(children: [IconButton(onPressed: (){}, icon: Icon(Icons.edit)), IconButton(onPressed: (){}, icon: IconButton(Icons.delete)]),),
            //   leading: CircleAvatar(
            //     backgroundColor:
            //         Colors.purple[300], // Warna latar belakang avatar
            //     child: Text(
            //       // Teks di dalam avatar (Misal: inisial)
            //       contactProvider.contacts[index]
            //           ['name']![0], // Mengambil inisial dari nama
            //       style: TextStyle(color: Colors.white), // Warna teks
            //     ),
            //   ),

            //   title: Text(contactProvider.contacts[index]['name']!),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //           'Phone: ${contactProvider.contacts[index]['phone']}'),
            //       Text('Date: ${contactProvider.contacts[index]['date']}'),
            //       Row(
            //         children: [
            //           Text('Color: '),
            //           Container(
            //               height:
            //                   10, // Atur tinggi container keinginan Anda
            //               width: 40, // Atur lebar container keinginan Anda
            //               decoration: BoxDecoration(
            //                 color: _selectedColor,
            //                 borderRadius: BorderRadius.circular(2),
            //               )),
            //         ],
            //       ),
            //       Text('File: ${contactProvider.contacts[index]['file']}'),
            //     ],
            //   ),
          ),
        ),
      ),
    );
  }
}
