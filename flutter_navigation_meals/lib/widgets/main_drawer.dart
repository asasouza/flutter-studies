import 'package:flutter/material.dart';

import '../screens/settings.dart';
import '../screens/tabs.dart';

class MainDrawer extends StatelessWidget {
  Widget _renderLink(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                'Meals App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
            ),
            SizedBox(height: 20,),
            _renderLink('Meals', Icons.restaurant, (){
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },),
            SizedBox(height: 20,),
            _renderLink('Settings', Icons.settings, (){
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
