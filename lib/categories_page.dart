import 'package:app_calendar/category_item.dart';
import 'package:app_calendar/fake_data.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        children: FAKE_CATEGORIES
            .map((eachCategory) => CategoryItem(category: eachCategory))
            .toList(),
      ),
    );
  }
}
