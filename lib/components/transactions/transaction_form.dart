import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  _showDatePicker() {
    date = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        date = value!;
        Provider.of<Transactions>(context, listen: false).setDateForm = date!;
      });
    });
  }

  @override
  void initState() {
    date = DateTime.now();
    Provider.of<Transactions>(context, listen: false).setDateForm = date!;

    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? title;
  double? value;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              onChanged: (value) =>
                  Provider.of<Transactions>(context, listen: false)
                      .setTitleForm = value,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyle(color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              onChanged: (val) =>
                  Provider.of<Transactions>(context, listen: false)
                      .setValueForm = double.tryParse(val)!,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                fillColor: Colors.blueAccent,
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  DateFormat(' dd-MM-y').format(date!),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text('Selecionar Data'),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
