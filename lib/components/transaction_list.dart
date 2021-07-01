import 'package:financas_pessoais/models/transaction.dart';
import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tr = Provider.of<Transactions>(context).listTransactions;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: tr.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
          child: Container(
            width: double.infinity,
            height: 70,
            child: Card(
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
                      "R\$" + "${tr[index].value.toString()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                  ),
                ),
                title: Text(
                  tr[index].title,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle:
                    Text(DateFormat(" dd/MM/yy hh:mm").format(tr[index].date)),
                trailing: Icon(
                  Icons.monetization_on,
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
