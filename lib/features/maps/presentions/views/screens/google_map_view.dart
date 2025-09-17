import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:safarni/features/maps/presentions/views/widgets/custom_list_view.dart';
import 'package:safarni/features/maps/presentions/views/widgets/custom_search_map.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            child: CustomSearchMap(
              text: "Search",
              onSearch: (country) async {
                LatLng? target = await getLatLngFromCountry(country);
                if (target != null) {
                  final controller = await _controller.future;
                  controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: target, zoom: 10),
                    ),
                  );
                }
              },
            ),
          ),
          Positioned(top: 150, right: 30, left: 30, child: CustomListViewMap()),
        ],
      ),
    );
  }
}

Future<LatLng?> getLatLngFromCountry(String country) async {
  try {
    List<Location> locations = await locationFromAddress(country);
    if (locations.isNotEmpty) {
      return LatLng(locations.first.latitude, locations.first.longitude);
    }
  } catch (e) {
    print("Error: $e");
  }
  return null;
}
