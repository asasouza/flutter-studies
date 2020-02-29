import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/places.dart';

import './screens/places_list.dart';
import './screens/add_place.dart';
import './screens/place_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'My Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (_) => AddPlaceScreen(),
          PlaceDetailsScreen.routeName: (_) => PlaceDetailsScreen(),
        },
      ),
    );
  }
}
