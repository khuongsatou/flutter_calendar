import 'package:app_calendar/foods_page.dart';

import 'models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  static const String routeName = '/CategoryItem';
  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: InkWell(
        onTap: () {
          print("In File: category_item.dart, Line: 13 ${category.content} ");
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return FoodsPage(category: category);
          // }));
          Navigator.pushNamed(context, FoodsPage.routeName,
              arguments: {"category": category});
        },
        splashColor: Colors.deepPurple,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  category.content,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 25,
                      fontFamily: 'Licorice-Regular',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.8),
                  category.color.withOpacity(0.9),
                  category.color,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0.0, 0.25, 1.0]),
          ),
        ),
      ),
    );
  }
}
