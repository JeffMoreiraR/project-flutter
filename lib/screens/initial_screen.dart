import 'package:consolidando_aprendizado/components/prgraming_languagues.dart';
import 'package:consolidando_aprendizado/screens/form_add_language.dart';
import 'package:flutter/material.dart';

import '../data/program_lang_inherited.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Programming Languages",
            style: TextStyle(fontSize: 22)),
      ),
      body: Container(
        color: Colors.white60,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 70),
          children: ProgramLanguagesInherited.of(context).languagesList,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (contextNew) => FormAddLanguage(languagueContext: context)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
