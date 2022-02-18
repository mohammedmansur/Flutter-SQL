import 'package:flutter/material.dart';
import 'package:fluttersql/database.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: Icon(Icons.add)),
      appBar: AppBar(title: Text('Note')),
      body: FutureBuilder<List<Grocesry>>(
        future: DatabaseHelper.instance.getGrocery(),
        builder: (context, AsyncSnapshot<List<Grocesry>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('no have any record'),
            );
          }
          return snapshot.data!.isEmpty
              ? Center(
                  child: Text('no note added yet'),
                )
              : ListView(
                  children: snapshot.data!.map((grocesry) {
                    return ListTile(
                      title: Text(grocesry.name),
                      onLongPress: () {
                        setState(() {
                          DatabaseHelper.instance.delete(grocesry.id!);
                        });
                      },
                      onTap: () {
                        name.text = grocesry.name;
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                children: [
                                  TextField(
                                    controller: name,
                                    decoration: InputDecoration(
                                      labelText: 'update name',
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          DatabaseHelper.instance.update(
                                              Grocesry(
                                                  id: grocesry.id,
                                                  name: name.text));
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Text('update'))
                                ],
                              );
                            });
                      },
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}
