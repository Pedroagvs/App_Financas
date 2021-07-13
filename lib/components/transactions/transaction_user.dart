import 'package:financas_pessoais/components/transactions/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TrasactionUserState createState() => _TrasactionUserState();
}

class _TrasactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Text("Grafico"),
          ),
          Container(
            width: double.infinity,
            height: 275,
            child: TransactionList(),
          ),
        ],
      ),
    );
  }
}
