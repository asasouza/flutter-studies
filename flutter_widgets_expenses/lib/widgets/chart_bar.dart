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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              child: FittedBox(
                child: Text('\$${amount.toStringAsFixed(0)}'),
              ),
              height: constraints.maxHeight * 0.15,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
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
              height: constraints.maxHeight * 0.6,
              width: 10,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              child: FittedBox(
                child: Text(label),
              ),
              height: constraints.maxHeight * 0.15,
            )
          ],
        );
      },
    );
  }
}
