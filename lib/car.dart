// ignore_for_file: unnecessary_this

class Car {
  late String name;
  late int yearOfProduction;

  // Cách 1
  // Car(String name, int yearOfProduction) {
  //   // ignore: prefer_initializing_formals
  //   this.name = name;
  //   // ignore: prefer_initializing_formals
  //   this.yearOfProduction = yearOfProduction;
  // }

  // Cách 2 Args
  Car({required this.name, this.yearOfProduction = 2021});

  // Function Event
  void doSomeThing() {
    this.handleEvent();

    // Only call in class
    this._doSomeThingAccess();
  }

  // access Private
  void _doSomeThingAccess() {
    // ignore: avoid_print
    print("Private granted");
  }

  @override
  String toString() {
    // TODO: implement toString
    return '${this.name}, ${this.yearOfProduction}';
  }

  late Function handleEvent;
}
