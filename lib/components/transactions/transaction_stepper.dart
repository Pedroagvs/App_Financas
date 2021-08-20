import 'package:financas_pessoais/components/accounts/accounts_list.dart';
import 'package:financas_pessoais/components/transactions/transaction_form.dart';
import 'package:financas_pessoais/components/transactions/transaction_type.dart';
import 'package:financas_pessoais/models/transaction.dart';
import 'package:financas_pessoais/provider/accounts.dart';
import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class TransactionStepper extends StatefulWidget {
  const TransactionStepper({Key? key}) : super(key: key);

  @override
  _TransactionStepperState createState() => _TransactionStepperState();
}

class _TransactionStepperState extends State<TransactionStepper> {
  int _stepIndex = 0;

  void submit() {
    var tr = Provider.of<Transactions>(context, listen: false);
    var acc = Provider.of<Accounts>(context, listen: false);
    tr.addTransaction(Transaction(
        id: Random().nextInt(100).toString(),
        title: tr.getTitleForm,
        date: tr.getDateForm,
        value: tr.getValueForm,
        typeofpayment: tr.getTypeForm));
    acc.updateAccount(acc.getIndexForm, tr.getValueForm);
  }

  List<Step> progresSteps() {
    List<Step> _steps = [
      Step(
          title: Text('Receitas / Depesas'),
          content: Container(
            height: 200,
            width: double.infinity,
            child: TransactionForm(),
          ),
          isActive: _stepIndex >= 0),
      Step(
          title: Text('Lista de Contas'),
          content: Container(
            height: 200,
            width: double.infinity,
            child: AccountList(),
          ),
          isActive: _stepIndex >= 1),
      Step(
          title: Text('Formas de Pagamento'),
          content: Container(
            height: 200,
            width: double.infinity,
            child: TransactionType(),
          ),
          isActive: _stepIndex >= 2),
    ];
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              onStepContinue: () {
                setState(() {
                  if (_stepIndex < progresSteps().length - 1) {
                    _stepIndex++;
                  } else {
                    submit();
                    Navigator.of(context).pop();
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_stepIndex > 0) {
                    _stepIndex--;
                  }
                });
              },
              currentStep: this._stepIndex,
              steps: progresSteps(),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
