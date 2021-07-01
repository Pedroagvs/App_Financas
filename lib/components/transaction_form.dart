import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TransactionForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? title;
  String? value;

  @override
  Widget build(BuildContext context) {
    var tr = Provider.of<Transactions>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 250,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(labelText: 'Título'),
                            onSaved: (value) {
                              if (value!.isNotEmpty) {
                                title = value;
                              }
                            },
                          ),
                          TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration:
                                  InputDecoration(labelText: 'Valor (R\$)'),
                              onSaved: (val) {
                                if (val!.isNotEmpty) {
                                  if (val != '0.00') {
                                    value = val;
                                  }
                                }
                              }),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          tr.addTransaction(title!, value!);
                        }

                        Navigator.of(context).pop();
                      },
                      child: Text("Confirmar"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
