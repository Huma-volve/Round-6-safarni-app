import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTextFormField extends StatefulWidget {
  final Completer<GoogleMapController> mapController;
  final Function(LatLng) onLocationSelected;

  const LocationTextFormField({
    super.key,
    required this.mapController,
    required this.onLocationSelected,
  });

  @override
  State<LocationTextFormField> createState() => _LocationTextFormFieldState();
}

class _LocationTextFormFieldState extends State<LocationTextFormField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _searchLocation() async {
    String query = _controller.text.trim();
    if (query.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        final target = LatLng(
          locations.first.latitude,
          locations.first.longitude,
        );
        widget.onLocationSelected(target);

        final controller = await widget.mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: target, zoom: 15),
          ),
        );
      }
    } catch (e) {
      print("Error finding location: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Location not found")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: _controller,
        onFieldSubmitted: (_) => _searchLocation(),
        decoration: InputDecoration(
          hintText: 'Enter a country or city',
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.location_on),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.blue),
            onPressed: _searchLocation,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
