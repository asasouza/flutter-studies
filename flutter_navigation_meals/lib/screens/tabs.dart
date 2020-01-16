import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

import './categories.dart';
import './favorites.dart';

class TabsScreen extends StatefulWidget {
  static final routeName = '/';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];

  int _selectedPage = 0;

  void _onChangeTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: _onChangeTab,
      ),
      drawer: MainDrawer(),
    );
  }
}
