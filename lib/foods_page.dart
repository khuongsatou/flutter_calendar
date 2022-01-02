import 'package:app_calendar/models/category.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';

  Category? category;

  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map;
    category = arguments['category'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Foods from ${category?.content}"),
        backgroundColor: category?.color,
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
