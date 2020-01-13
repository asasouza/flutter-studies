import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions founded!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: constraints.maxHeight * 0.7,
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              Transaction transaction = transactions[index];
              return TransactionItem(transaction: transaction, deleteTransaction: deleteTransaction);
            },
            itemCount: transactions.length,
          );
  }
}