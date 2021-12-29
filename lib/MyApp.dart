// StatelessWidget -> update User Interface
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // init state
  String name;
  int age;
  // contructor
  MyApp({required this.name, required this.age});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late String _email = "";

  final edtEmailController = TextEditingController();

  // Vòng đời.
  @override
  void initState() {
    // TODO: implement initState
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 27 ${'1 START STATE'} ");
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 38 ${'END Dispose STATE'} ");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 38 ${'2 BUILD'} ");
    }
    // ignore: todo
    // TODO: implement build
    return MaterialApp(
      title: "title here",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: TextField(
                  controller: edtEmailController,
                  onChanged: (text) {
                    setState(() {
                      if (kDebugMode) {
                        print(
                            "In File: MyApp.dart, Line: 65 ${'3 SET EMAIL'} ");
                      }
                      _email = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter you email..."),
                ),
              ),
              Text(
                'Person A: ${widget.name} ${widget.age}',
                style: const TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
              Text(
                _email,
                style: const TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
