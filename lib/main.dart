import 'package:app_calendar/counter_app.dart';
import 'package:app_calendar/counter_page.dart';
import 'package:app_calendar/fake_data.dart';
import 'package:app_calendar/foods_page.dart';
import 'package:app_calendar/models/category.dart';
import 'package:flutter/material.dart';

import 'categories_page.dart';
import 'detail_food_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Transaction app",
      initialRoute: '/',
      routes: {FoodsPage.routeName: (content) => FoodsPage()},
      home: CounterApp(),
      theme: ThemeData(
        fontFamily: 'Licorice-Regular',
        primarySwatch: Colors.red,
        // primarySwatch: Color.pink[]
      ),
    ),
  );
}
