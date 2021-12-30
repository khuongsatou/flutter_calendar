import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> listTransactions = [];
  TransactionList({required this.listTransactions});

  Widget _getContent(transaction) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.content,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text("Date ${transaction.createAt}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300))
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white, style: BorderStyle.solid, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  "${transaction.amount.toString()}\$",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
              )
            ],
          ),
        ),
      ]),
    );
  }

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
            child: _getContent(listTransactions[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: _buildListView(),
    );
  }
}
