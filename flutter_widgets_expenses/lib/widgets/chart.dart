import 'package:flutter/material.dart';
import 'package:flutter_widgets_expenses/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;

      for (var transaction in recentTransactions) {
        final date = transaction.date;
        if (date.day == weekDay.day &&
            date.month == weekDay.month &&
            date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpent {
    return _groupedTransactions.fold(0.0, (sum, transaction) {
      return sum + transaction['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransactions.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                amount: transaction['amount'],
                amountPercentage: totalSpent == 0.0
                    ? 0.0
                    : (transaction['amount'] as double) / totalSpent,
                label: transaction['day'],
              ),
            );
          }).toList(),
        ),
        padding: EdgeInsets.all(10),
      ),
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}
