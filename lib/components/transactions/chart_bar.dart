import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double? valueDespesas;
  final double? valueReceitas;
  final String? label;
  final double? percentageDespesas;
  final double? percentageReceitas;

  ChartBar({
    this.label,
    this.percentageDespesas,
    this.percentageReceitas,
    this.valueDespesas,
    this.valueReceitas,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Container(
              height: 20,
              child: FittedBox(
                child: Text(
                  '${valueDespesas!.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 80,
                      width: 10,
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //      color: Colors.grey,
                      //      width: 1.0,
                      //     ),
                      //     color: Color.fromRGBO(220, 220, 220, 1),
                      //     borderRadius: BorderRadius.circular(5),
                      //  ),
                    ),
                    Container(
                      height: 80,
                      width: 10,
                      child: FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: percentageDespesas,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 80,
                      width: 10,
                      //   decoration: BoxDecoration(
                      //    border: Border.all(
                      //      color: Colors.grey,
                      //      width: 1.0,
                      //    ),
                      //    color: Color.fromRGBO(220, 220, 220, 1),
                      //    borderRadius: BorderRadius.circular(5),
                      //  ),
                    ),
                    Container(
                      height: 80,
                      width: 10,
                      child: FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: percentageReceitas,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            FittedBox(
                child: Text(
              '${valueReceitas!.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.green),
            )),
            SizedBox(
              height: 5,
            ),
            Text(label!),
          ],
        ),
      ),
    );
  }
}
