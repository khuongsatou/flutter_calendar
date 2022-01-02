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
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Foods"),
        ),
        body: DetailFoodPage(food: FAKE_FOOD[0]),
      ),
      theme: ThemeData(
        fontFamily: 'Licorice-Regular',
        primarySwatch: Colors.red,
        // primarySwatch: Color.pink[]
      ),
    ),
  );
}
