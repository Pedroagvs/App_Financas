import 'package:financas_pessoais/components/accounts/accounts_form.dart';
import 'package:financas_pessoais/components/transactions/transaction_stepper.dart';
import 'package:financas_pessoais/pages/home_page.dart';

import 'package:financas_pessoais/provider/transactions.dart';
import 'package:financas_pessoais/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/accounts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Transactions(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => new Accounts(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        routes: {
          Routes.HOME: (_) => Home(),
          Routes.StepperTransaction: (_) => StepperTransaction(),
          Routes.AccountFORM: (_) => AccountsForm(),
        },
      ),
    );
  }
}
