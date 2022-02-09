import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_super_example/constants/constatns.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super Google Map"),
        centerTitle: true,
        elevation: 0,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed(NavigationPaths.justMap);
              },
              child: Text("Bare Map"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(NavigationPaths.mapWithMarker);
              },
              child: Text("Map with markers"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(NavigationPaths.addMarkerToMap);
              },
              child: Text("Add Marker to map"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(NavigationPaths.placesSearch);
              },
              child: Text("Place Search"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Map with route"),
            ),
          ],
        ),
      ),
    );
  }
}
