import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../helpers/location.dart';

import '../screens/map.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectLocation;

  LocationInput(this.onSelectLocation);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _mapImageUrl;

  void _setLocation(double latitude, double longitude) {
    setState(() {
      _mapImageUrl = LocationHelper.getLocationImageUrl(
        latitude: latitude,
        longitude: longitude,
      );
    });
    widget.onSelectLocation(latitude, longitude);
  }

  Future<void> _getLocation() async {
    final location = await Location().getLocation();
    _setLocation(
      location.latitude,
      location.longitude,
    );
  }

  Future<void> _openMapScreen() async {
    final selectedPlace = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (_) => MapScreen(
          isSelecting: true,
        ),
        fullscreenDialog: true,
      ),
    );
    _setLocation(
      selectedPlace.latitude,
      selectedPlace.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: _mapImageUrl == null
              ? Text(
                  'No place chosen!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _mapImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, image, progress) => progress == null
                      ? image
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          height: 170,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              onPressed: _getLocation,
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Pick on Map'),
              onPressed: _openMapScreen,
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
