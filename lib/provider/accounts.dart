import 'package:financas_pessoais/models/account.dart';

import 'package:flutter/material.dart';

class Accounts extends ChangeNotifier {
  String? titleTempAccount;
  int? indextempAccount;
  List<Account> _listAccount = [Account(title: "Carteira", value: 0.0)];

  List<Account> get list {
    return _listAccount;
  }

  addAccount(Account newAcc) {
    _listAccount.add(newAcc);
    notifyListeners();
  }

  updateAccount(int index, double value) {
    _listAccount.elementAt(index).value =
        _listAccount.elementAt(index).value! + value;
    notifyListeners();
  }

  removeAccount(String accTittle) {
    if (accTittle != "Carteira") {
      _listAccount.remove(accTittle);
      notifyListeners();
    }
  }

  set setTitleAccForm(String title) {
    titleTempAccount = title;
    notifyListeners();
  }

  get getTitleForm {
    return titleTempAccount;
  }

  set setIndexAccForm(int index) {
    indextempAccount = index;
    notifyListeners();
  }

  get getIndexForm {
    return indextempAccount;
  }
}
