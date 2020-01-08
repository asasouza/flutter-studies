import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Models
import './models/transaction.dart';
// Widgets
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        errorColor: Colors.red.shade300,
        fontFamily: 'Quicksand',
        primarySwatch: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
      ),
      home: HomeScreen(title: 'Personal Expenses'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekend Trip',
      amount: 35.99,
      date: DateTime.now(),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime selectedDate) {
    final transaction = new Transaction(
      title: title,
      amount: amount,
      date: selectedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _openModalTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _isLandscape = _mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget _appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expenses',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  onTap: () => _openModalTransaction(context),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          )
        : AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _openModalTransaction(context),
              )
            ],
            title: Text(widget.title),
          );

    final _screenHeight = _mediaQuery.size.height -
        (_appBar.preferredSize.height + _mediaQuery.padding.top);

    final _transactionListWidget = Container(
      child: TransactionList(_userTransactions, _deleteTransaction),
      height: _screenHeight * 0.7,
    );

    final _pageBody = SafeArea(
      child: Column(
        children: <Widget>[
          if (_isLandscape)
            Row(
              children: <Widget>[
                Text('Show Chart', style: Theme.of(context).textTheme.title,),
                Switch.adaptive(
                  activeColor: Theme.of(context).accentColor,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                  value: _showChart,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          if (!_isLandscape)
            Container(
              child: Chart(_recentTransactions),
              height: _screenHeight * 0.3,
            ),
          if (!_isLandscape) _transactionListWidget,
          if (_isLandscape)
            _showChart
                ? Container(
                    child: Chart(_recentTransactions),
                    height: _screenHeight * 0.7,
                  )
                : _transactionListWidget
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _pageBody,
            navigationBar: _appBar,
          )
        : Scaffold(
            appBar: _appBar,
            body: _pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _openModalTransaction(context),
                  ),
          );
  }
}
