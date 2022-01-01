// StatelessWidget -> update User Interface
import 'package:app_calendar/TransactionList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';

class MyApp extends StatefulWidget {
  // init state
  // contructor
  const MyApp({Key? key}) : super(key: key);

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
  Transaction _transaction =
      Transaction(id: 0, content: "", amount: 0.0, createAt: "");
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

  void showSnackBar(text) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: text,
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ),
    );
  }

  // Validate nội dung không rỗng, không được nhập số 0 vào amount và amount là float
  void _insertTransaction() {
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      showSnackBar(const Text('Form không hợp lệ vui lòng thử lại'));
      return;
    }

    setState(() {
      // Thêm vào array
      _transaction.id = _listTransactions.length - 1;

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formatted = formatter.format(now);

      _transaction.createAt = formatted;
      // Show snack bar mới thêm.
      showSnackBar(Text('Item ${_transaction.toString()}'));
      _listTransactions.add(_transaction);
      _listTransactions.sort((a, b) {
        return b.id - a.id;
      });
      _transaction = Transaction(id: 0, content: "", amount: 0.0, createAt: "");
      // clear controller
      _contentController.text = "";
      _amountController.text = "";
    });
  }

  void _closeModal() {
    Navigator.of(context).pop();
  }

  void _openModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
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
                          border: OutlineInputBorder(),
                          labelText: "Content..."),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              _insertTransaction();
                              _closeModal();
                            },
                            child: const Text("OK"),
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10)),
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              _closeModal();
                            },
                            child: const Text("Cancel"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("In File: MyApp.dart, Line: 38 ${'2 BUILD'} ");
    }
    // Create datetime
    // DateTime now = DateTime(2021, 12, 30);

    // ignore: todo
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Add transaction",
        onPressed: () {},
        child: const Icon(Icons.call),
      ),
      appBar: AppBar(
        title: const Text("Manager Order"),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 50),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              OutlinedButton(
                onPressed: () {
                  _openModalBottomSheet();
                },
                child: const Text("Press open bottom modal"),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: TransactionList(listTransactions: _listTransactions),
              )
            ],
          )),
    );
  }
}
