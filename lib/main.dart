import 'package:app_calendar/MyApp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Transaction app",
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.red,
      // primarySwatch: Color.pink[]
    ),
  ));
}
