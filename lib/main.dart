import 'package:app_calendar/foods_page.dart';
import 'package:app_calendar/models/category.dart';
import 'package:flutter/material.dart';

import 'categories_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Transaction app",
    initialRoute: '/',
    routes: {FoodsPage.routeName: (content) => FoodsPage()},
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
