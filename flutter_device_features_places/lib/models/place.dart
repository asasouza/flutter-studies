import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final String address;
  final double latitude;
  final double longitude;

  const PlaceLocation({
    this.address,
    @required this.latitude,
    @required this.longitude,
  });
}

class Place {
  final String id;
  final File image;
  final PlaceLocation location;
  final String title;

  Place({
    @required this.id,
    @required this.image,
    @required this.location,
    @required this.title,
  });
}
