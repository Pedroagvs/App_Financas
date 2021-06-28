import 'package:financas_pessoais/components/transaction_list.dart';
import 'package:financas_pessoais/routes/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finanças'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.TrasactionFORM);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        child: TrasactionList(),
      ),
    );
  }
}
