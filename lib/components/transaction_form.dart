import 'package:flutter/material.dart';

class TrasactionForm extends StatelessWidget {
  const TrasactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Confirmar"),
            )
          ],
        ),
      ),
    );
  }
}
