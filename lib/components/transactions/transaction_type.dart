import 'package:financas_pessoais/models/typeofpayment.dart';
import 'package:flutter/material.dart';

class TransactionType extends StatefulWidget {
  const TransactionType({Key? key}) : super(key: key);

  @override
  _TransactionTypeState createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<TransactionType> {
  List<TypePayment> type = [
    TypePayment(title: 'Crédito', check: false),
    TypePayment(title: 'Débito', check: false),
    TypePayment(title: 'Pix', check: false),
    TypePayment(title: 'Dinheiro', check: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: type.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
                title: Text('${type[index].title}'),
                value: type[index].check,
                onChanged: (value) {
                  setState(() {
                    type[index].check = value;
                  });
                });
          }),
    );
  }
}
