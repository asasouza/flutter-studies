import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

import '../helpers/database.dart';

class Places extends ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  Place findById(String id) {
    return _places.firstWhere((place) => place.id == id);
  }

  void addPlace({
    @required String title,
    @required File image,
    @required PlaceLocation location,
  }) async {
    final place = Place(
      id: UniqueKey().toString(),
      image: image,
      location: location,
      title: title,
    );
    _places.add(place);
    notifyListeners();
    await DatabaseHelper.insert('place', {
      'id': place.id,
      'image': place.image.path,
      'title': place.title,
      'latitude': place.location.latitude,
      'longitude': place.location.longitude,
      'address': place.location.address,
    });
  }

  Future<void> getAndSetPlaces() async {
    final places = await DatabaseHelper.select('place');
    _places = places
        .map(
          (place) => Place(
            id: place['id'],
            image: File(place['image']),
            location: PlaceLocation(
              latitude: place['latitude'],
              longitude: place['longitude'],
              address: place['address'],
            ),
            title: place['title'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
