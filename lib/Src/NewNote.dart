import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  DateTime? dateTime;
  String? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Note'),
              ),
            ),
            ListTile(
              title: dateTime == null ? Text('Pic Date') : Text(date!),
              trailing: IconButton(
                  onPressed: () {
                    _showDatePicker();
                  },
                  icon: Icon(Icons.date_range)),
              tileColor: Colors.blue,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Add Note'))
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        dateTime = value!;
        date = dateTime!.day.toString() +
            '/' +
            dateTime!.month.toString() +
            '/' +
            dateTime!.year.toString();
      });
    });
  }
}
