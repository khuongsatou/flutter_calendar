import 'package:app_calendar/foods_page.dart';
import 'package:app_calendar/models/category.dart';
import 'package:flutter/material.dart';

import 'categories_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Transaction app",
    initialRoute: '/',
    routes: {
      '/FoodsPage': (content) =>
          FoodsPage(category: Category(id: 0, content: "", color: Colors.red))
    },
    home: Scaffold(
        appBar: AppBar(
          title: Text("App Foods"),
        ),
        body: const CategoriesPage()),
    theme: ThemeData(
      primarySwatch: Colors.red,
      // primarySwatch: Color.pink[]
    ),
  ));
}
