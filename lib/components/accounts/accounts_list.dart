import 'package:financas_pessoais/models/account.dart';
import 'package:financas_pessoais/provider/accounts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountList extends StatefulWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  List<Account> listAccounts = [];
  _loadList() {
    var acc = Provider.of<Accounts>(context).list;
    return acc;
  }

  @override
  void didChangeDependencies() {
    listAccounts = _loadList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listAccounts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: Text(
                    listAccounts[index].title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "R\$" + listAccounts[index].value!,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
