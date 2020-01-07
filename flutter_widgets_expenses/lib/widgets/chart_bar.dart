import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double amountPercentage;

  ChartBar({
    @required this.label,
    @required this.amount,
    @required this.amountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: FittedBox(
            child: Text('\$${amount.toStringAsFixed(0)}'),
          ),
          height: 20,
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(3),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Theme.of(context).primaryColor),
                ),
                heightFactor: amountPercentage,
              ),
            ],
          ),
          height: 60,
          width: 10,
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
