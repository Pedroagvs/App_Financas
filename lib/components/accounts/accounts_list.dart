import 'package:financas_pessoais/models/account.dart';
import 'package:financas_pessoais/provider/accounts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  List<Account> listAccounts = [];
  int _selectedIndex = 0;

  _loadList() {
    List<Account> acc = Provider.of<Accounts>(context).list;
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Text(
                      listAccounts[index].title!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    trailing: Text(
                      "R\$" + listAccounts[index].value!.toStringAsFixed(2),
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      textAlign: TextAlign.center,
                    ),
                    selected: index == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        Provider.of<Accounts>(context, listen: false)
                            .setTitleAccForm = listAccounts[index].title!;
                        Provider.of<Accounts>(context, listen: false)
                            .setIndexAccForm = index;
                      });
                    },
                    selectedTileColor: Colors.cyan[50],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
