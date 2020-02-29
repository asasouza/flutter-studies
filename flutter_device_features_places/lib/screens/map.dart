import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialPlace;
  final bool isSelecting;

  MapScreen({
    this.initialPlace = const PlaceLocation(
      latitude: 0,
      longitude: 0,
    ),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _selectedPlace;

  void _onSelectPlace(location) {
    setState(() {
      _selectedPlace = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Place'),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _selectedPlace == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_selectedPlace);
                    },
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialPlace.latitude,
            widget.initialPlace.longitude,
          ),
          zoom: 3,
        ),
        onTap: widget.isSelecting ? _onSelectPlace : null,
        markers: (_selectedPlace == null && widget.isSelecting)
            ? null
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _selectedPlace ??
                      LatLng(
                        widget.initialPlace.latitude,
                        widget.initialPlace.longitude,
                      ),
                ),
              },
      ),
    );
  }
}
