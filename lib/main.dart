import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(name: 'khuong', age: 22));
}

// StatelessWidget -> update User Interface
class MyApp extends StatelessWidget {
  // init state
  String name;
  int age;
  // contructor
  MyApp({required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Center(
      child: Text(
        'Person A: ${this.name} ${this.age}',
        style: const TextStyle(fontSize: 20),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
