import 'package:flutter/material.dart';
import 'package:flutter_widgets_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

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
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Padding(
                      child: FittedBox(
                        child: Text('\$${transaction.amount}'),
                      ),
                      padding: EdgeInsets.all(6),
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          onPressed: () => deleteTransaction(transaction.id),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTransaction(transaction.id),
                        ),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              );
            },
            itemCount: transactions.length,
          );
  }
}
