import 'package:app_calendar/fake_data.dart';
import 'package:flutter/material.dart';

import 'models/food.dart';

class DetailFoodPage extends StatelessWidget {
  Food food = FAKE_FOOD[0];
  DetailFoodPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Expanded(
            child: Center(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: food.urlName),
            ),
          ),
          const Text(
            "Ingredients:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: food.ingredients?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#$index',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      food.ingredients![index],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
