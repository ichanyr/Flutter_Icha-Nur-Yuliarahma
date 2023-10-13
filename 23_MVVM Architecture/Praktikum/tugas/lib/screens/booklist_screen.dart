import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/screens/booklist_view_model.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key, required this.title});
  final String title;

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    final modelView = Provider.of<BookViewModel>(context, listen: false);
    modelView.getContacts();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final modelView = Provider.of<ContactViewModel>(context, listen: false);
  //     modelView.getContacts();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<BookViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: modelView.books.length,
        itemBuilder: (context, index) {
          final book = modelView.books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.year.toString()),
          );
        },
      ),
    );
  }
}
