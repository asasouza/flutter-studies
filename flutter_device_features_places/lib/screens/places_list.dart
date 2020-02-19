import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

import './add_place.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<Places>(
        builder: (ctx, places, child) => places.places.length == 0
            ? child
            : ListView.separated(
                itemBuilder: (context, index) {
                  final place = places.places[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(place.image),
                      radius: 30,
                    ),
                    title: Text(place.title),
                    onTap: () {},
                  );
                },
                itemCount: places.places.length,
                separatorBuilder: (context, index) => Divider(),
              ),
        child: Center(
          child: Text('No places added yet.'),
        ),
      ),
    );
  }
}
