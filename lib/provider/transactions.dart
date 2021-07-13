import 'package:financas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends ChangeNotifier {
  List<Transaction> _transaction = [];

  List<Transaction> get listTransactions {
    return _transaction;
  }

  addTransaction(Transaction newTr) {
    _transaction.add(newTr);
    notifyListeners();
  }

  deleteTransaction(String id) {
    notifyListeners();
  }
}
