import 'package:flutter/material.dart';

class ListContactsScreen extends StatelessWidget {
  const ListContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Contacts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(),
    );
  }
}
