import 'package:flutter/material.dart';

// void main() {
//  runApp(MainApp());
// }

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  void onAnswer() {
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Application'),
        ),
        body: Column(
          children: [
            Text('Quiz App'),
            Text('Question 1'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: onAnswer,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Answer 2 chosen'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                //...
                print('Answer 3 chosen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
