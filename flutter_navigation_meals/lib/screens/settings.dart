import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static final routeName = '/settings';

  final Map<String, bool> filters;
  final Function setFilters;

  SettingsScreen(this.filters, this.setFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _gluten = false;
  var _lactose = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  void initState() {
    _gluten = widget.filters['gluten'];
    _lactose = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  void _setFilters() {
    widget.setFilters({
      'gluten': _gluten,
      'lactose': _lactose,
      'vegan': _vegan,
      'vegetarian': _vegetarian
    });
  }

  Widget _renderSwitches(
    String title,
    String subtitle,
    bool value,
    Function onChange,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).primaryColorDark,
      onChanged: (newValue) {
        onChange(newValue);
        _setFilters();
      },
      subtitle: Text(subtitle),
      title: Text(title),
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Setup the filters for the meals',
              style: Theme.of(context).textTheme.title,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _renderSwitches(
                  'Gluten-free',
                  'Only gluten-free meals',
                  _gluten,
                  (newValue) {
                    setState(() {
                      _gluten = newValue;
                    });
                  },
                ),
                _renderSwitches(
                  'Lactose-free',
                  'Only lactose-free meals',
                  _lactose,
                  (newValue) {
                    setState(() {
                      _lactose = newValue;
                    });
                  },
                ),
                _renderSwitches(
                  'Vegetarian',
                  'Only vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _renderSwitches(
                  'Vegan',
                  'Only vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
