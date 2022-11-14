import 'package:consolidando_aprendizado/screens/initial_screen.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Learning Programming Languages",
                style: TextStyle(fontSize: 22)),
          ),
          body: Container(
            color: Colors.white60,
            child: ListView(scrollDirection: Axis.vertical, children: const [
              InitialScreen("Python", "assets/images/python.png"),
              InitialScreen("Java", "assets/images/java.png"),
              InitialScreen("JavaScript", "assets/images/js.png"),
              InitialScreen("C++", "assets/images/c++.png"),
              InitialScreen("C", "assets/images/c.png"),
              InitialScreen("Rust", "assets/images/rust.png"),
              InitialScreen("Julia", "assets/images/julia.png"),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )),
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
