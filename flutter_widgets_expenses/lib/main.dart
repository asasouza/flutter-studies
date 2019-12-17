import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'My Expenses'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: Text('CHARTS'),
              color: Colors.blue,
              elevation: 3,
            ),
            height: 150,
            width: double.infinity,
          ),
          Container(
            child: Card(
              child: Text('LIST OF TX'),
              color: Colors.yellowAccent,
            ),
            height: 300,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
