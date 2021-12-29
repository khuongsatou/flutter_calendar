import 'package:flutter/material.dart';
import 'car.dart';

void main() {
  // var mycar = Car('Kia morning', 50);
  var mycar = Car(name: 'Kia morning', yearOfProduction: 2021);
  mycar.handleEvent = () {
    // ignore: avoid_print
    print("Set handle Event later");
  };
  mycar.doSomeThing();
  // denial
  // mycar._doSomeThingAccess();
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
