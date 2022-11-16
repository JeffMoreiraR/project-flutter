import 'package:consolidando_aprendizado/components/prgraming_languagues.dart';
import 'package:flutter/material.dart';

class ProgramLanguagesInherited extends InheritedWidget {
   ProgramLanguagesInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<ProgrammingLanguages> languagesList = [
    ProgrammingLanguages("Python", "assets/images/python.png", 3),
    ProgrammingLanguages("Java", "assets/images/java.png", 4),
    ProgrammingLanguages("JavaScript", "assets/images/js.png", 2),
    ProgrammingLanguages("C++", "assets/images/c++.png", 5),
    ProgrammingLanguages("C", "assets/images/c.png", 5),
    ProgrammingLanguages("Rust", "assets/images/rust.png", 1),
    ProgrammingLanguages("Julia", "assets/images/julia.png", 1),
  ];

  void addLanguage(String languageName, String image, int difficulty){
    languagesList.add(ProgrammingLanguages(languageName, image, difficulty));
  }


  static ProgramLanguagesInherited of(BuildContext context) {
    final ProgramLanguagesInherited? result = context.dependOnInheritedWidgetOfExactType<ProgramLanguagesInherited>();
    assert(result != null, 'No InheritedLanguagesList found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProgramLanguagesInherited oldWidget) {
    return oldWidget.languagesList.length != languagesList.length;
  }
}
