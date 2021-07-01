import 'dart:math';

import 'package:financas_pessoais/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:financas_pessoais/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TrasactionUserState createState() => _TrasactionUserState();
}

class _TrasactionUserState extends State<TransactionUser> {
  List<Transaction> transactions = [];

  addTransaction(String title, String value) {
    var newTr = Transaction(
        date: DateTime.now(),
        id: Random().nextDouble().toString(),
        title: title,
        value: value);
    setState(() {
      transactions.add(newTr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: double.infinity, height: 350, child: TransactionList()),
        ],
      ),
    );
  }
}
