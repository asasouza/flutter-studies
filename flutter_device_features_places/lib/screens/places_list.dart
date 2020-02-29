import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

import './add_place.dart';
import './place_details.dart';

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
      body: FutureBuilder(
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Places>(
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
                                subtitle: Text(place.location.address),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    PlaceDetailsScreen.routeName,
                                    arguments: place.id,
                                  );
                                },
                              );
                            },
                            itemCount: places.places.length,
                            separatorBuilder: (context, index) => Divider(),
                          ),
                    child: Center(
                      child: Text('No places added yet.'),
                    ),
                  ),
        future: Provider.of<Places>(context, listen: false).getAndSetPlaces(),
      ),
    );
  }
}
