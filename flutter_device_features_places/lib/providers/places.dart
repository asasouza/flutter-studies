import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

import '../helpers/database.dart';

class Places extends ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace({
    @required String title,
    @required File image,
  }) async {
    final place = Place(
      id: UniqueKey().toString(),
      image: image,
      location: null,
      title: title,
    );
    _places.add(place);
    notifyListeners();
    await DatabaseHelper.insert('place', {
      'id': place.id,
      'image': place.image.path,
      'title': place.title,
    });
  }

  Future<void> getAndSetPlaces() async {
    final places = await DatabaseHelper.select('place');
    _places = places
        .map(
          (place) => Place(
            id: place['id'],
            image: File(place['image']),
            location: null,
            title: place['title'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
