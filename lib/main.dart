import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'car.dart';

void main() {
  // Init old
  // var mycar = Car('Kia morning', 50);
  // Init args
  var mycar = Car(name: 'Kia morning', yearOfProduction: 2021);
  mycar.handleEvent = () {
    // ignore: avoid_print
    print("Set handle Event later");
  };
  mycar.doSomeThing();
  // denial
  // mycar._doSomeThingAccess();

  // List Object
  List<Car> cars = <Car>[
    Car(name: "Kia 1", yearOfProduction: 2020),
    Car(name: "Kia 2", yearOfProduction: 2021),
    Car(name: "Kia 3", yearOfProduction: 2023),
  ];

  if (kDebugMode) {
    print(cars);
  }

  // where list
  var car_2023 =
      cars.where((element) => element.yearOfProduction == 2023).toList();
  if (kDebugMode) {
    print(car_2023);
  }

  // get list name
  List<String> carsName = cars.map((item) => item.name).toList();
  if (kDebugMode) {
    print(carsName);
  }

  // Kiểu key value , nếu với nhiều value thì dùng dynamic
  Map<String, dynamic> personA = {};

  personA['name'] = 'khuong';
  personA['age'] = 18;

  if (kDebugMode) {
    print("In File: main.dart, Line: 48 ${personA}");
  }

  // ignore: avoid_print
  print(mycar);
  runApp(Center(
    child: Text(
      'abc ${mycar.toString()}',
      style: const TextStyle(fontSize: 20),
      textDirection: TextDirection.ltr,
    ),
  ));
}
