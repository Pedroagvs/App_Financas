import 'package:financas_pessoais/models/transaction.dart';
import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var valueController = TextEditingController();
  String? typeOfPayment;

  _submitForm() {
    var tr = Provider.of<Transactions>(context, listen: false);
    if (titleController.text.isNotEmpty && valueController.text.isNotEmpty) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        tr.addTransaction(Transaction(
            date: DateTime.now(),
            title: titleController.text,
            value: valueController.text,
            typeofpayment: typeOfPayment!));
      }
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 250,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          maxLength: 20,
                          controller: titleController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: 'Título'),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: valueController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(labelText: 'Valor (R\$)'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
