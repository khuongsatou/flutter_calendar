import 'package:app_calendar/models/category.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  Category category;
  FoodsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foods from ${category.content}"),
        backgroundColor: category.color,
      ),
      body: Container(
        child: Center(
          child: Text(
            "123",
            style: TextStyle(fontSize: 20, fontFamily: 'Licorice-Regular'),
          ),
        ),
      ),
    );
  }
}
