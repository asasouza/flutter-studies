import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

class Places extends ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace({
    @required String title,
    @required File image,
  }) {
    final place = Place(
      id: UniqueKey().toString(),
      image: image,
      location: null,
      title: title,
    );
    _places.add(place);
    notifyListeners();
  }
}
