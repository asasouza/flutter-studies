import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String label;
  final Function handler;

  AdaptiveFlatButton(this.label, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            color: Theme.of(context).primaryColor,
            onPressed: handler,
          )
        : RaisedButton(
            child: Text(label),
            color: Theme.of(context).primaryColor,
            onPressed: handler,
            textColor: Theme.of(context).textTheme.button.color,
          );
  }
}
