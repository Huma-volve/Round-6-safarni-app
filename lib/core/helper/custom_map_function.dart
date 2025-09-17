import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationHelper {
  static Future<LatLng?> getLatLngFromCountry(String country) async {
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
}
