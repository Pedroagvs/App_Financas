import 'package:financas_pessoais/components/transactions/transaction_user.dart';
import 'package:financas_pessoais/routes/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              ListTile(
                title: Text(
                  'Contas',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(
                  Icons.account_balance_wallet_outlined,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.AccountFORM),
              ),
              ListTile(
                title: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(
                  Icons.exit_to_app_sharp,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Finanças',
        ),
        centerTitle: true,
      ),
      body: Container(
        child: TransactionUser(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.add_circle_sharp,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.TransactionStepper),
          ),
        ],
      ),
    );
  }
}
