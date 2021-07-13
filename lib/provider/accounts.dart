import 'package:financas_pessoais/models/account.dart';
import 'package:flutter/material.dart';

class Accounts extends ChangeNotifier {
  List<Account> _listAccount = [Account(title: "Carteira", value: "0.00")];

  addAccount(Account newAcc) {
    _listAccount.add(newAcc);
    notifyListeners();
  }

  removeAccount() {
    notifyListeners();
  }

  List<Account> get list {
    return _listAccount;
  }
}
