import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWitMarkerScreen extends StatefulWidget {
  const MapWitMarkerScreen({Key? key}) : super(key: key);

  @override
  _MapWitMarkerScreenState createState() => _MapWitMarkerScreenState();
}

class _MapWitMarkerScreenState extends State<MapWitMarkerScreen> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController;

  List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(29.9792345, 31.1342019),
        infoWindow: InfoWindow(title: 'The great pyramid of Giza'),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.637861, 21.63),
        infoWindow: InfoWindow(title: 'Statue of Zeus at Olympia'),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.94972, 27.363889),
        infoWindow: InfoWindow(title: 'Temple of Artemis at Ephesus'),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.0379, 27.4241),
        infoWindow: InfoWindow(title: 'Mausoleum at Halicarnassus'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialLocation,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(_markers),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    );
  }
}
