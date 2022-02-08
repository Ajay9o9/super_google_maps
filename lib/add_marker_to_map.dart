import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMarkerToMapScreen extends StatefulWidget {
  const AddMarkerToMapScreen({Key? key}) : super(key: key);

  @override
  _AddMarkerToMapScreenState createState() => _AddMarkerToMapScreenState();
}

class _AddMarkerToMapScreenState extends State<AddMarkerToMapScreen> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController;

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
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
      markers: Set<Marker>.of(_markers.values),
      onTap: (LatLng) {
        Fluttertoast.showToast(
            msg: "Long press to add marker to map",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      onLongPress: (latlng) {
        _addMarkerLongPressed(latlng);
      },
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    );
  }

  Future _addMarkerLongPressed(LatLng latlang) async {
    setState(() {
      final MarkerId markerId = MarkerId("RANDOM_ID");
      Marker marker = Marker(
        markerId: markerId,
        draggable: true,
        position:
            latlang, //With this parameter you automatically obtain latitude and longitude
        infoWindow: InfoWindow(
          title: "Marker here",
          snippet: latlang.toString(),
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      _markers[markerId] = marker;
    });

    //This is optional, it will zoom when the marker has been created
    mapController.animateCamera(CameraUpdate.newLatLngZoom(latlang, 17.0));
  }
}
