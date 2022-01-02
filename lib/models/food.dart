// ignore_for_file: constant_identifier_names

import 'dart:math';

class Food {
  late int id;
  late String name;
  late String urlName;
  late Duration? duration;
  late Complexity? complexity;

  late List<String>? ingredients = [];

  late int? categoryId;

  Food(
      {required this.name,
      required this.urlName,
      this.duration,
      this.complexity,
      this.ingredients,
      this.categoryId}) {
    // ID  auto-increment random
    id = Random().nextInt(1000);
  }
}

enum Complexity { Simple, Medium, Hard }
