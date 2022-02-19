import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/widgets/bar_chart.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      double totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      print("new line begins here\n");
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  double get _weeklyTransactionSum {
    return recentTransaction.fold(
        0.01, (previousValue, element) => previousValue + element.amount);
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactionValue;
    return Row(
      children: [
        ...groupedTransactionValue.map((mapElement) {
          return Column(
            children: [
              Container(
                color: Colors.blue.shade700,
                height: 300,
                width: 218,
                child: BarChart(
                  mapElement['day'] as String,
                  mapElement['amount'] as double,
                  double.parse(
                      ((mapElement['amount'] as double) / _weeklyTransactionSum)
                          .toStringAsFixed(2)),
                ),
              )
            ],
          );
        }).toList()
      ],
    );
  }
}
