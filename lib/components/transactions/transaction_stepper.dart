import 'package:financas_pessoais/components/accounts/accounts_list.dart';
import 'package:financas_pessoais/components/transactions/transaction_form.dart';
import 'package:financas_pessoais/components/transactions/transaction_type.dart';

import 'package:flutter/material.dart';

class StepperTransaction extends StatefulWidget {
  const StepperTransaction({Key? key}) : super(key: key);

  @override
  _StepperTransactionState createState() => _StepperTransactionState();
}

class _StepperTransactionState extends State<StepperTransaction> {
  int _stepIndex = 0;
  List<Step> progresSteps() {
    List<Step> _steps = [
      Step(
          title: Text('Entradas / Saidas'),
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
        child: Stepper(
          onStepContinue: () {
            setState(() {
              if (_stepIndex < progresSteps().length - 1) {
                _stepIndex++;
              }
            });
          },
          currentStep: this._stepIndex,
          steps: progresSteps(),
        ),
      ),
    );
  }
}
