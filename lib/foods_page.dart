import 'package:app_calendar/fake_data.dart';
import 'package:app_calendar/models/category.dart';
import 'package:flutter/material.dart';

import 'models/food.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';

  Category? category = Category(id: 0, content: "", color: Colors.red);

  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    // Map<dynamic, dynamic> arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map;

    // if (arguments.containsKey('category')) {
    //   category = arguments['category'];
    // }

    List<Food> foods =
        FAKE_FOOD.where((food) => category?.id == food.categoryId).toList();

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Foods from ${category?.content}"),
        backgroundColor: category?.color,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              Food food = foods[index];
              return Container(
                padding: const EdgeInsets.all(20),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/loading.gif',
                                  image: food.urlName),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            height: 80.0,
                            child: Row(
                              children: [
                                const Icon(Icons.timer,
                                    color: Colors.white, size: 25),
                                Text(
                                  '${food.duration?.inMinutes} minutes',
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 500,
                          child: Container(
                            height: 80.0,
                            child: Row(
                              children: [
                                Text(
                                  food.complexity.toString().split('.').last,
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Container(
                            height: 80.0,
                            child: Row(
                              children: [
                                Text(
                                  '${food.name}',
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              );

              // return Card(
              //   elevation: 10,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: ListTile(
              //     title: Text(foods[index].name),
              //     subtitle: Text("abc"),
              //   ),
              // );
            }),
      ),
    );
  }
}
