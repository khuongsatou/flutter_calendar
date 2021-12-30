import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> listTransactions = [];
  TransactionList({required this.listTransactions});

  // Create Function list
  ListView _buildListView() {
    return ListView.builder(
        itemCount: listTransactions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: listTransactions[index].id % 2 == 0
                ? Colors.green[600]
                : Colors.pink[300],
            child: ListTile(
              leading: const Icon(Icons.access_alarm),
              title: Text(
                listTransactions[index].content,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(listTransactions[index].amount.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300)),
              onTap: () {
                if (kDebugMode) {
                  print("In File: MyApp.dart, Line: 164 ${'tap_me'} ");
                }
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _buildListView(),
    );
  }
}
