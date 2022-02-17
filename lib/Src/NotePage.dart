import 'package:flutter/material.dart';
import 'package:fluttersql/database.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: Icon(Icons.add)),
      appBar: AppBar(title: Text('Note')),
      body: SingleChildScrollView(
          child: FutureBuilder<List<Grocesry>>(
        future: DatabaseHelper.instance.getGrocery(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {}
        },
      )),
    );
  }
}
