import 'package:flutter/material.dart';
import 'package:praktik/contact.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contactProvider.contacts.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(contactProvider.contacts[index]['name']!),
          subtitle: Text(contactProvider.contacts[index]['phone']!),
        ),
      ),
    );
  }
}
