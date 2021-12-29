// StatelessWidget -> update User Interface
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  // init state
  // contructor
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late String _content = "";
  late double _amount = 0;

  // final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  //     new GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  // Vòng đời.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Đăng ký event
    WidgetsBinding.instance?.addObserver(this);
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 27 ${'1 START STATE'} ");
    }
  }

  // Check background and foreground
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      if (kDebugMode) {
        print("In File: MyApp.dart, Line: 41 ${'Background mode'} ");
      }
    } else if (state == AppLifecycleState.resumed) {
      if (kDebugMode) {
        print("In File: MyApp.dart, Line: 45 ${'Foreground mode'} ");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 38 ${'END Dispose STATE'} ");
    }
    // Clean event
    WidgetsBinding.instance?.removeObserver(this);

    //clean controller
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 38 ${'2 BUILD'} ");
    }
    // Create datetime
    DateTime now = new DateTime(2021, 12, 30);

    // ignore: todo
    // TODO: implement build
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      title: "title here",
      home: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: TextField(
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        if (kDebugMode) {
                          print(
                              "In File: MyApp.dart, Line: 65 ${'3 SET EMAIL'} ");
                        }
                        _content = text;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Content..."),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: TextField(
                    controller: _amountController,
                    onChanged: (text) {
                      setState(() {
                        if (kDebugMode) {
                          print(
                              "In File: MyApp.dart, Line: 65 ${'3 SET AMOUNT'} ");
                        }
                        _amount = double.tryParse(text) ?? 0;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Amount..."),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("abc")),)
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: const Text('snack'),
                    //     duration: const Duration(seconds: 1),
                    //     action: SnackBarAction(
                    //       label: 'ACTION',
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // );
                    rootScaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(
                        content: Text(
                            'Content ${this._content} Amount ${this._amount}'),
                        duration: const Duration(seconds: 1),
                        action: SnackBarAction(
                          label: 'ACTION',
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: const Text("Press a call"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
