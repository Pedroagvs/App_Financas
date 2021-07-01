import 'package:financas_pessoais/pages/home_page.dart';
import 'package:financas_pessoais/components/transaction_form.dart';
import 'package:financas_pessoais/provider/transactions.dart';
import 'package:financas_pessoais/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Transactions(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        routes: {
          Routes.HOME: (_) => Home(),
          Routes.TransactionFORM: (_) => TransactionForm(),
        },
      ),
    );
  }
}
