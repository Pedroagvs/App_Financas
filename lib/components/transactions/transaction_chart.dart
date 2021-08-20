import 'package:financas_pessoais/components/transactions/chart_bar.dart';
import 'package:financas_pessoais/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get groupedTransactons {
    return List.generate(7, (index) {
      var recentTransaction = Provider.of<Transactions>(context, listen: false)
          .listTransactions
          .where((tr) {
        return tr.date!.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      }).toList();
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalDepesas = 0.0;
      double totalReceitas = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date!.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date!.month == weekDay.month;
        bool sameYear = recentTransaction[i].date!.year == weekDay.year;
        if (sameDay && sameMonth && sameYear) {
          if (recentTransaction[i].value! > 0) {
            totalReceitas += recentTransaction[i].value!;
          }
          if (recentTransaction[i].value! < 0) {
            totalDepesas += recentTransaction[i].value!;
          }
        }
      }
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'valueR': totalReceitas,
        'valueD': totalDepesas,
      };
    }).reversed.toList();
  }

  double get _weekTotalValueDespesas {
    return groupedTransactons.fold(0.0, (sum, tr) {
      return sum + (tr['valueD'] as double);
    });
  }

  double get _weekTotalValueReceitas {
    return groupedTransactons.fold(0.0, (sum, tr) {
      return sum + (tr['valueR'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      color: Colors.black38,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactons.map((tr) {
            return ChartBar(
              label: tr['day'] as String,
              valueDespesas:
                  tr['valueD'] == 0.0 ? 0.0 : (tr['valueD'] as double),
              valueReceitas:
                  tr['valueR'] == 0.0 ? 0.0 : (tr['valueR'] as double),
              percentageDespesas: tr['valueD'] == 0.0
                  ? 0.0
                  : (tr['valueD'] as double) / _weekTotalValueDespesas,
              percentageReceitas: tr['valueR'] == 0.0
                  ? 0.0
                  : (tr['valueR'] as double) / _weekTotalValueReceitas,
            );
          }).toList(),
        ),
      ),
    );
  }
}
