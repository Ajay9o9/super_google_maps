import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_super_example/pages/add_marker_to_map.dart';
import 'package:google_maps_super_example/constants/constatns.dart';
import 'package:google_maps_super_example/pages/home_screen.dart';
import 'package:google_maps_super_example/pages/just_map.dart';

import 'dart:math' show cos, sqrt, asin;

import 'package:google_maps_super_example/keys.dart';
import 'package:google_maps_super_example/pages/map_places.dart';
import 'package:google_maps_super_example/pages/map_with_markers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: NavigationPaths.homePage,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/just_map',
      name: NavigationPaths.justMap,
      builder: (context, state) => const JustMapScreen(),
    ),
    GoRoute(
      path: '/view_markers',
      name: NavigationPaths.mapWithMarker,
      builder: (context, state) => const MapWitMarkerScreen(),
    ),
    GoRoute(
      path: '/add_markers',
      name: NavigationPaths.addMarkerToMap,
      builder: (context, state) => const AddMarkerToMapScreen(),
    ),
    GoRoute(
      path: '/places',
      name: NavigationPaths.placesSearch,
      builder: (context, state) => MapView(),
    ),
    GoRoute(
      path: '/directions',
      name: NavigationPaths.directions,
      builder: (context, state) => MapView(),
    ),
  ], initialLocation: '/');

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Super Google Map',
      );

  //
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Maps',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: AddMarkerToMapScreen(),
  //   );
  // }
}
