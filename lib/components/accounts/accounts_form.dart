import 'package:financas_pessoais/components/accounts/accounts_list.dart';
import 'package:financas_pessoais/models/account.dart';
import 'package:financas_pessoais/provider/accounts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountsForm extends StatefulWidget {
  @override
  _AccountsFormState createState() => _AccountsFormState();
}

class _AccountsFormState extends State<AccountsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final initValueController = TextEditingController();

  _submitForm() {
    var newAcc = Provider.of<Accounts>(context, listen: false);
    if (titleController.text.isNotEmpty &&
        initValueController.text.isNotEmpty) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          newAcc.addAccount(Account(
            title: titleController.text,
            value: double.tryParse(initValueController.text)!,
          ));
        });
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 270,
                  child: Form(
                    key: _formKey,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              "Nova Conta",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: TextFormField(
                                maxLength: 20,
                                controller: titleController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    InputDecoration(labelText: 'Título'),
                                validator: (value) {
                                  if (value == null) {
                                    return "Campo obrigatorio";
                                  }
                                },
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: initValueController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration:
                                    InputDecoration(labelText: 'Valor (R\$)'),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 170,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: _submitForm,
                                child: Text(
                                  'Criar',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  "Lista de Contas",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 220,
                width: double.infinity,
                child: Card(child: AccountList()),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    "Voltar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
