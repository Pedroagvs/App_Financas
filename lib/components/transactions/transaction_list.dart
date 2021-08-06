import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  void initState() {
    initializeDateFormatting('pt_BR');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listTransaction = _loadList();
    super.didChangeDependencies();
  }

  iconType(String title) {
    if (title.toLowerCase() == 'dinheiro') {
      return Icon(
        Icons.money,
        color: Colors.lightBlue,
        size: 30,
      );
    }
    if (title.toLowerCase() == 'credito' || title.toLowerCase() == 'debito') {
      return Icon(
        Icons.credit_card,
        color: Colors.lightBlue,
        size: 30,
      );
    }
    if (title.toLowerCase() == 'debito') {
      return Icon(
        Icons.credit_card,
        color: Colors.lightBlue,
        size: 30,
      );
    } else {
      return ImageIcon(
        AssetImage(
          'assets/logo-pix-icone-1024.png',
          bundle: null,
        ),
        size: 30,
        color: Colors.lightBlue,
      );
    }
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
              color: Colors.brown[50],
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
                          fontSize: 17,
                          color:
                              Provider.of<Transactions>(context, listen: false)
                                  .colorValue(listTransaction[index].value!)),
                    ),
                  ),
                ),
                title: Text(
                  listTransaction[index].title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                subtitle: Text(
                  DateFormat(" dd/MM/yy").format(listTransaction[index].date),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: iconType(
                    Provider.of<Transactions>(context, listen: false)
                        .listTransactions[index]
                        .typeofpayment!),
              ),
            ),
          ),
        );
      },
    );
  }
}
