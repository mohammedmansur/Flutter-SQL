import 'package:flutter/material.dart';

import 'Src/NewNote.dart';
import 'Src/NotePage.dart';
import 'Src/Update.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const NotePage(),
        '/new': (context) => const NewNote(),
        '/update': (context) => const UpdateNote(),
      },
    );
  }
}
