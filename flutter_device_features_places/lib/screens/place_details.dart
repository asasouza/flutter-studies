import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/places.dart';

import '../screens/map.dart';

class PlaceDetailsScreen extends StatelessWidget {
  static const routeName = '/place-details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final place = Provider.of<Places>(context).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            height: 200,
            width: double.infinity,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            child: Text(
              place.location.address,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MapScreen(
                    initialPlace: place.location,
                    isSelecting: false,
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            icon: Icon(Icons.map),
            label: Text('View on Map'),
            textColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
