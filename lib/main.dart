import 'package:financas_pessoais/pages/home_page.dart';
import 'package:financas_pessoais/components/transaction_form.dart';
import 'package:financas_pessoais/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.HOME: (_) => Home(),
        Routes.TrasactionFORM: (_) => TrasactionForm(),
      },
    );
  }
}
