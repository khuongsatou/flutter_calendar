// StatelessWidget -> update User Interface
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';

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

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  // Init list transaction
  Transaction _transaction = Transaction(id: 0, content: "", amount: 0.0);
  // ignore: deprecated_member_use
  final List<Transaction> _listTransactions = [];

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
    // DateTime now = DateTime(2021, 12, 30);

    // Create Function list
    List<Widget> _buildWidgetList() {
      return _listTransactions.map((transaction) {
        return Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: transaction.id % 2 == 0 ? Colors.green[600] : Colors.pink[300],
          child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: Text(
              transaction.content,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(transaction.amount.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300)),
            onTap: () {
              if (kDebugMode) {
                print("In File: MyApp.dart, Line: 164 ${'tap_me'} ");
              }
            },
          ),
        );
      }).toList();
    }

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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextField(
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        if (kDebugMode) {
                          print(
                              "In File: MyApp.dart, Line: 65 ${'3 SET EMAIL'} ");
                        }
                        // _content = text;
                        _transaction.content = text;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Content..."),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextField(
                    controller: _amountController,
                    onChanged: (text) {
                      setState(() {
                        if (kDebugMode) {
                          print(
                              "In File: MyApp.dart, Line: 65 ${'3 SET AMOUNT'} ");
                        }
                        // _amount = double.tryParse(text) ?? 0;
                        _transaction.amount = double.tryParse(text) ?? 0;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Amount..."),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    rootScaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(
                        content: Text('Item ${this._transaction.toString()}'),
                        duration: const Duration(seconds: 1),
                        action: SnackBarAction(
                          label: 'ACTION',
                          onPressed: () {},
                        ),
                      ),
                    );
                    setState(() {
                      // Thêm vào array
                      _transaction.id = _listTransactions.length - 1;
                      _listTransactions.add(_transaction);
                      _listTransactions.sort((a, b) {
                        return b.id - a.id;
                      });
                      _transaction =
                          Transaction(id: 0, content: "", amount: 0.0);
                      // clear controller
                      _contentController.text = "";
                      _amountController.text = "";
                    });
                  },
                  child: const Text("Press a call"),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Column(
                    children: _buildWidgetList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
