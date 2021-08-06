import 'package:financas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends ChangeNotifier {
  String? titleTemp;
  double? valueTemp;
  String? typeTemp;

  List<Transaction> _transaction = [];

  List<Transaction> get listTransactions {
    return _transaction;
  }

  addTransaction(Transaction newTr) {
    _transaction.add(newTr);
    notifyListeners();
  }

  deleteTransaction(String id) {
    _transaction.remove(id);
    notifyListeners();
  }

  colorValue(double valueTr) {
    if (valueTr > 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  set setTitleForm(String title) {
    titleTemp = title;
    notifyListeners();
  }

  set setValueForm(double value) {
    valueTemp = value;
    notifyListeners();
  }

  set setTypeForm(String type) {
    typeTemp = type;
  }

  double get getValueForm {
    return valueTemp!;
  }

  String get getTitleForm {
    return titleTemp!;
  }

  String get getTypeForm {
    return typeTemp!;
  }
}
