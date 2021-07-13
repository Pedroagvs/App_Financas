import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  var listTransaction;
  _loadList() {
    var tr = Provider.of<Transactions>(context).listTransactions;
    return tr;
  }

  @override
  void didChangeDependencies() {
    listTransaction = _loadList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listTransaction.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
          child: Container(
            width: double.infinity,
            height: 80,
            child: Card(
              color: Colors.purple[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "R\$" + ' ' "${listTransaction[index].value!}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                  ),
                ),
                title: Text(
                  listTransaction[index].title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent),
                ),
                subtitle: Text(
                  DateFormat(" dd/MM/yy hh:mm")
                      .format(listTransaction[index].date),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: Icon(
                  Icons.credit_card,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
