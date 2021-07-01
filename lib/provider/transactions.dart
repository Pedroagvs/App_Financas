import 'dart:math';

import 'package:financas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends ChangeNotifier {
  List<Transaction> _transaction = [];

  List<Transaction> get listTransactions {
    return _transaction;
  }

  addTransaction(String title, String value) {
    var newTr = Transaction(
        date: DateTime.now(),
        id: Random().nextDouble().toString(),
        title: title,
        value: value);
    _transaction.add(newTr);
    notifyListeners();
  }

  deleteTransaction(String id) {
    _transaction.remove(id);
    notifyListeners();
  }
}
