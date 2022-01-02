import 'package:flutter/material.dart';
import './models/category.dart';
import 'models/food.dart';

// ignore: unnecessary_const, constant_identifier_names, non_constant_identifier_names
List<Category> FAKE_CATEGORIES = [
  Category(id: 1, content: "Japan foods", color: Colors.red),
  Category(id: 2, content: "Piza", color: Colors.green),
  Category(id: 3, content: "Humburgers", color: Colors.blue),
  Category(id: 1, content: "Japan foods", color: Colors.red),
  Category(id: 2, content: "Piza", color: Colors.green),
  Category(id: 3, content: "Humburgers", color: Colors.blue),
  Category(id: 1, content: "Japan foods", color: Colors.red),
  Category(id: 2, content: "Piza", color: Colors.green),
  Category(id: 3, content: "Humburgers", color: Colors.blue),
  Category(id: 1, content: "Japan foods", color: Colors.red),
  Category(id: 2, content: "Piza", color: Colors.green),
  Category(id: 3, content: "Humburgers", color: Colors.blue)
];

List<Food> FAKE_FOOD = [
  Food(
      name: "SET YUKI",
      urlName:
          "https://images.foody.vn/res/g96/951421/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-190828142005.jpg",
      duration: const Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['SuShi-Meshi', 'Nori', 'Condiments'],
      categoryId: 1),
  Food(
      name: "ROBUSUTA",
      urlName:
          "https://images.foody.vn/res/g67/662390/prof/s640x400/foody-upload-api-foody-mobile-6ec017c3-c232-45fb-8-200429162344.jpg",
      duration: const Duration(minutes: 20),
      complexity: Complexity.Simple,
      ingredients: ['Tôm hùm Alaska', 'Cá hồi Na Uy ', 'sò đỏ Canada'],
      categoryId: 1),
  Food(
      name: "SUSHI KEKI",
      urlName:
          "https://images.foody.vn/res/g96/951421/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-190828142005.jpg",
      duration: const Duration(minutes: 10),
      complexity: Complexity.Simple,
      ingredients: ['Bánh sushi', 'Su shi cao cấp', 'sò đỏ Canada'],
      categoryId: 2),
  Food(
      name: "SET YUKI",
      urlName:
          "https://images.foody.vn/res/g96/951421/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-190828142005.jpg",
      duration: const Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['SuShi-Meshi', 'Nori', 'Condiments'],
      categoryId: 3),
  Food(
      name: "ROBUSUTA",
      urlName:
          "https://images.foody.vn/res/g101/1002749/prof/s640x400/foody-upload-api-foody-mobile-7df31982b6d94950b116-200218153517.jpg",
      duration: const Duration(minutes: 20),
      complexity: Complexity.Simple,
      ingredients: ['Tôm hùm Alaska', 'Cá hồi Na Uy ', 'sò đỏ Canada'],
      categoryId: 3),
  Food(
      name: "SUSHI KEKI",
      urlName:
          "https://images.foody.vn/res/g96/951421/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-190828142005.jpg",
      duration: const Duration(minutes: 10),
      complexity: Complexity.Simple,
      ingredients: ['Bánh sushi', 'Su shi cao cấp', 'sò đỏ Canada'],
      categoryId: 3),
];
