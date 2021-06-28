import 'package:financas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {
  TrasactionList({Key? key}) : super(key: key);
  final List<Transaction> _trasaction = [
    Transaction(id: '1', date: DateTime.now(), title: 'Festa', value: 35.00),
    Transaction(
        id: '2', date: DateTime.now(), title: 'Supermercado', value: 1500.00),
    Transaction(id: '3', date: DateTime.now(), title: 'Açai', value: 20.00),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _trasaction.length,
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
                          "R\$" + "${_trasaction[index].value.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.purple),
                        ),
                      ),
                    ),
                    title: Text(
                      _trasaction[index].title,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(DateFormat(" dd/MM/yy hh:mm")
                        .format(_trasaction[index].date)),
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
        ),
      ),
    );
  }
}
