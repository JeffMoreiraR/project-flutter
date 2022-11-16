import 'package:consolidando_aprendizado/data/program_lang_inherited.dart';
import 'package:consolidando_aprendizado/screens/initial_screen.dart';
import 'package:flutter/material.dart';

import 'components/prgraming_languagues.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProgramLanguagesInherited(child: InitialScreen()),
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
