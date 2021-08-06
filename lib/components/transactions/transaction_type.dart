import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TransactionType extends StatefulWidget {
  @override
  _TransactionTypeState createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<TransactionType> {
  List<String> type = [
    'Credito',
    'Debito',
    'Pix',
    'Dinheiro',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: type.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Center(
                  child: Text(
                '${type[index]}',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.7),
              )),
              selected: index == _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  Provider.of<Transactions>(context, listen: false)
                      .setTypeForm = type[index].toLowerCase();
                });
              },
              selectedTileColor: Colors.cyan[50],
            ),
          );
        });
  }
}
